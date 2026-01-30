from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Post
from datetime import datetime

router = APIRouter(prefix="/upload", tags=["Upload"])
@router.post("/")
def upload_post(
    user_id: int,
    media_url: str,
    caption: str = "",
    post_type: str = "post",  # post | reel | gallery
    db: Session = Depends(get_db)
):
    post = Post(
        user_id=user_id,
        media_url=media_url,
        caption=caption,
        post_type=post_type,
        created_at=datetime.utcnow()
    )
    db.add(post)
    db.commit()
    return {
        "status": "uploaded",
        "type": post_type
    }
