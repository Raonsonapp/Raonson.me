from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from models.follow import Follow

router = APIRouter(prefix="/follow", tags=["Follow"])

@router.post("/")
def follow_user(follower_id: int, following_id: int, db: Session = Depends(get_db)):
    if follower_id == following_id:
        raise HTTPException(status_code=400, detail="Cannot follow yourself")

    exists = db.query(Follow).filter_by(
        follower_id=follower_id,
        following_id=following_id
    ).first()

    if exists:
        raise HTTPException(status_code=400, detail="Already following")

    follow = Follow(follower_id=follower_id, following_id=following_id)
    db.add(follow)
    db.commit()
    return {"status": "followed"}

@router.delete("/")
def unfollow_user(follower_id: int, following_id: int, db: Session = Depends(get_db)):
    follow = db.query(Follow).filter_by(
        follower_id=follower_id,
        following_id=following_id
    ).first()

    if not follow:
        raise HTTPException(status_code=404, detail="Not following")

    db.delete(follow)
    db.commit()
    return {"status": "unfollowed"}

@router.get("/count/{user_id}")
def follow_count(user_id: int, db: Session = Depends(get_db)):
    followers = db.query(Follow).filter_by(following_id=user_id).count()
    following = db.query(Follow).filter_by(follower_id=user_id).count()
    return {
        "followers": followers,
        "following": following
            }
