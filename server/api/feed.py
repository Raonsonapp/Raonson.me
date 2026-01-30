from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Post, Like, Comment
from datetime import datetime

router = APIRouter(prefix="/feed", tags=["Feed"])
@router.get("/")
def get_feed(db: Session = Depends(get_db)):
    posts = db.query(Post).order_by(Post.created_at.desc()).all()
    result = []

    for post in posts:
        likes = db.query(Like).filter(Like.post_id == post.id).count()
        comments = db.query(Comment).filter(Comment.post_id == post.id).count()

        result.append({
            "id": post.id,
            "user_id": post.user_id,
            "media_url": post.media_url,
            "caption": post.caption,
            "likes": likes,
            "comments": comments,
            "created_at": post.created_at
        })

    return result
  @router.post("/{post_id}/like")
def like_post(post_id: int, user_id: int, db: Session = Depends(get_db)):
    existing = db.query(Like).filter_by(post_id=post_id, user_id=user_id).first()

    if existing:
        db.delete(existing)
        db.commit()
        return {"status": "unliked"}

    like = Like(
        user_id=user_id,
        post_id=post_id
    )
    db.add(like)
    db.commit()
    return {"status": "liked"}
  @router.post("/{post_id}/comment")
def comment_post(post_id: int, user_id: int, text: str, db: Session = Depends(get_db)):
    comment = Comment(
        user_id=user_id,
        post_id=post_id,
        text=text,
        created_at=datetime.utcnow()
    )
    db.add(comment)
    db.commit()
    return {"status": "comment_added"} 
