from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models.like import Like
from models.comment import Comment
from auth import get_current_user

router = APIRouter(prefix="/interactions", tags=["Likes & Comments"])
@router.post("/like/{post_id}")
def toggle_like(post_id: int,
                db: Session = Depends(get_db),
                user = Depends(get_current_user)):

    like = db.query(Like)\
        .filter_by(user_id=user.id, post_id=post_id)\
        .first()

    if like:
        db.delete(like)
        db.commit()
        return {"liked": False}

    new_like = Like(user_id=user.id, post_id=post_id)
    db.add(new_like)
    db.commit()
    return {"liked": True}
@router.post("/comment/{post_id}")
def add_comment(post_id: int,
                text: str,
                db: Session = Depends(get_db),
                user = Depends(get_current_user)):

    comment = Comment(
        post_id=post_id,
        user_id=user.id,
        text=text
    )
    db.add(comment)
    db.commit()
    return {"success": True}
@router.get("/comments/{post_id}")
def get_comments(post_id: int, db: Session = Depends(get_db)):
    comments = db.query(Comment)\
        .filter_by(post_id=post_id)\
        .order_by(Comment.created_at.desc())\
        .all()

    return [{
        "id": c.id,
        "user_id": c.user_id,
        "text": c.text,
        "created_at": c.created_at
    } for c in comments]
  @router.get("/likes/{post_id}")
def like_count(post_id: int, db: Session = Depends(get_db)):
    count = db.query(Like)\
        .filter_by(post_id=post_id)\
        .count()
    return {"likes": count}
