from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from .database import get_db
from . import models, auth

router = APIRouter(prefix="/follow", tags=["Follow"])

@router.post("/{username}")
def follow_user(
    username: str,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    target = db.query(models.User).filter(models.User.username == username).first()
    if not target:
        raise HTTPException(status_code=404)

    if target.id == current_user.id:
        raise HTTPException(status_code=400, detail="Cannot follow yourself")

    exists = db.query(models.Follow).filter(
        models.Follow.follower_id == current_user.id,
        models.Follow.following_id == target.id
    ).first()

    if exists:
        raise HTTPException(status_code=400, detail="Already following")

    follow = models.Follow(
        follower_id=current_user.id,
        following_id=target.id
    )
    db.add(follow)
    db.commit()
    return {"status": "followed"}
@router.delete("/{username}")
def unfollow_user(
    username: str,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    target = db.query(models.User).filter(models.User.username == username).first()
    if not target:
        raise HTTPException(status_code=404)

    follow = db.query(models.Follow).filter(
        models.Follow.follower_id == current_user.id,
        models.Follow.following_id == target.id
    ).first()

    if not follow:
        raise HTTPException(status_code=400, detail="Not following")

    db.delete(follow)
    db.commit()
    return {"status": "unfollowed"}
    @router.get("/status/{username}")
def follow_status(
    username: str,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    target = db.query(models.User).filter(models.User.username == username).first()
    if not target:
        raise HTTPException(status_code=404)

    is_following = db.query(models.Follow).filter(
        models.Follow.follower_id == current_user.id,
        models.Follow.following_id == target.id
    ).first() is not None

    return {"is_following": is_following}
