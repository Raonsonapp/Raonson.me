from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Post, Like, Comment
from datetime import datetime

router = APIRouter(prefix="/reels", tags=["Reels"])
@router.get("/")
def get_reels(db: Session = Depends(get_db)):
    reels = db.query(Post)\
        .filter(Post.post_type == "reel")\
        .order_by(Post.created_at.desc())\
        .all()

    return reels
  @router.post("/{reel_id}/like")
def like_reel(reel_id: int, user_id: int, db: Session = Depends(get_db)):
    like = Like(user_id=user_id, post_id=reel_id)
    db.add(like)
    db.commit()
    return {"status": "liked"}
  @router.post("/{reel_id}/comment")
def comment_reel(
    reel_id: int,
    user_id: int,
    text: str,
    db: Session = Depends(get_db)
):
    comment = Comment(
        user_id=user_id,
        post_id=reel_id,
        text=text,
        created_at=datetime.utcnow()
    )
    db.add(comment)
    db.commit()
    return {"status": "comment added"}
  @router.post("/{reel_id}/view")
def add_view(reel_id: int, db: Session = Depends(get_db)):
    reel = db.query(Post).get(reel_id)
    reel.views += 1
    db.commit()
    return {"views": reel.views}
