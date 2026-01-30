from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/feed", tags=["Feed"])
@router.get("/")
def get_feed(
    page: int = 1,
    limit: int = 10,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    following_ids = db.query(models.Follow.following_id)\
        .filter(models.Follow.follower_id == current_user.id)

    posts = db.query(models.Post)\
        .filter(
            (models.Post.user_id == current_user.id) |
            (models.Post.user_id.in_(following_ids))
        )\
        .order_by(models.Post.created_at.desc())\
        .offset((page - 1) * limit)\
        .limit(limit)\
        .all()

    return posts
/feed?page=1&limit=10
/feed?page=2&limit=10  
