from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/posts", tags=["Posts"])

@router.post("/")
def create_post(
    data: schemas.PostCreate,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    post = models.Post(
        user_id=current_user.id,
        caption=data.caption,
        media_url=data.media_url
    )
    db.add(post)
    db.commit()
    return {"status": "posted"}
@router.post("/{post_id}/like")
def like_post(
    post_id: int,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    exists = db.query(models.Like).filter(
        models.Like.user_id == current_user.id,
        models.Like.post_id == post_id
    ).first()

    if exists:
        db.delete(exists)
        db.commit()
        return {"liked": False}

    like = models.Like(user_id=current_user.id, post_id=post_id)
    db.add(like)
    db.commit()
    return {"liked": True}
    @router.post("/{post_id}/comment")
def add_comment(
    post_id: int,
    data: schemas.CommentCreate,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    comment = models.Comment(
        user_id=current_user.id,
        post_id=post_id,
        text=data.text
    )
    db.add(comment)
    db.commit()
    return {"status": "commented"}
