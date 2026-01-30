from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Follow, User
from auth import get_current_user

router = APIRouter(prefix="/follows", tags=["Follows"])
@router.post("/{user_id}")
def toggle_follow(user_id: int,
                  db: Session = Depends(get_db),
                  user = Depends(get_current_user)):

    if user.id == user_id:
        return {"error": "Cannot follow yourself"}

    target = db.query(User).filter_by(id=user_id).first()
    if not target:
        return {"error": "User not found"}

    follow = db.query(Follow)\
        .filter_by(follower_id=user.id, following_id=user_id)\
        .first()

    if follow:
        db.delete(follow)
        user.following_count -= 1
        target.followers_count -= 1
        db.commit()
        return {"following": False}

    new_follow = Follow(
        follower_id=user.id,
        following_id=user_id
    )
    db.add(new_follow)
    user.following_count += 1
    target.followers_count += 1
    db.commit()
    return {"following": True}
@router.get("/followers/{user_id}")
def followers(user_id: int, db: Session = Depends(get_db)):
    followers = db.query(Follow)\
        .filter_by(following_id=user_id)\
        .all()

    return [{
        "id": f.follower.id,
        "username": f.follower.username,
        "avatar": f.follower.avatar
    } for f in followers]
@router.get("/following/{user_id}")
def following(user_id: int, db: Session = Depends(get_db)):
    following = db.query(Follow)\
        .filter_by(follower_id=user_id)\
        .all()

    return [{
        "id": f.following.id,
        "username": f.following.username,
        "avatar": f.following.avatar
    } for f in following]
  @router.get("/status/{user_id}")
def follow_status(user_id: int,
                  db: Session = Depends(get_db),
                  user = Depends(get_current_user)):

    follow = db.query(Follow)\
        .filter_by(follower_id=user.id, following_id=user_id)\
        .first()

    return {"following": bool(follow)}
