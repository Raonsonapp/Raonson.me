from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import User, Follow, Post

router = APIRouter(prefix="/profile", tags=["Profile"])
@router.get("/{user_id}")
def get_profile(user_id: int, db: Session = Depends(get_db)):
    user = db.query(User).get(user_id)

    posts_count = db.query(Post)\
        .filter(Post.user_id == user_id)\
        .count()

    followers = db.query(Follow)\
        .filter(Follow.following_id == user_id)\
        .count()

    following = db.query(Follow)\
        .filter(Follow.follower_id == user_id)\
        .count()

    return {
        "id": user.id,
        "username": user.username,
        "avatar": user.avatar,
        "bio": user.bio,
        "verified": user.is_verified,
        "posts": posts_count,
        "followers": followers,
        "following": following
  }
  @router.post("/{user_id}/follow")
def follow(user_id: int, follower_id: int, db: Session = Depends(get_db)):
    follow = Follow(
        follower_id=follower_id,
        following_id=user_id
    )
    db.add(follow)
    db.commit()
    return {"status": "followed"}
  @router.post("/{user_id}/unfollow")
def unfollow(user_id: int, follower_id: int, db: Session = Depends(get_db)):
    db.query(Follow)\
      .filter(
          Follow.follower_id == follower_id,
          Follow.following_id == user_id
      )\
      .delete()

    db.commit()
    return {"status": "unfollowed"}
  @router.post("/{user_id}/update")
def update_profile(
    user_id: int,
    bio: str = "",
    avatar: str = "",
    db: Session = Depends(get_db)
):
    user = db.query(User).get(user_id)
    user.bio = bio
    user.avatar = avatar
    db.commit()
    return {"status": "updated"}
