from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/profile", tags=["Profile"])

@router.get("/{username}", response_model=schemas.ProfileResponse)
def get_profile(username: str, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.username == username).first()
    if not user:
        raise HTTPException(status_code=404)

    profile = db.query(models.Profile).filter(models.Profile.user_id == user.id).first()
    followers = db.query(models.Follow).filter(models.Follow.following_id == user.id).count()
    following = db.query(models.Follow).filter(models.Follow.follower_id == user.id).count()

    return {
        "username": user.username,
        "bio": profile.bio if profile else "",
        "avatar": profile.avatar if profile else None,
        "followers": followers,
        "following": following
    }
