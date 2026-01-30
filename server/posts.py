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
