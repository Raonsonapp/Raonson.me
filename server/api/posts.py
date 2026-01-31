from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models.post import Post

router = APIRouter(prefix="/posts", tags=["Posts"])

@router.post("/create")
def create_post(
    user_id: int,
    media_url: str,
    caption: str = "",
    db: Session = Depends(get_db)
):
    post = Post(
        user_id=user_id,
        media_url=media_url,
        caption=caption
    )
    db.add(post)
    db.commit()
    db.refresh(post)
    return post
