from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Comment
from auth import get_current_user

router = APIRouter(prefix="/comments", tags=["Comments"])
@router.post("/{post_id}")
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

    return {"status": "ok"}
                  @router.get("/{post_id}")
def get_comments(post_id: int, db: Session = Depends(get_db)):
    comments = db.query(Comment)\
        .filter_by(post_id=post_id)\
        .order_by(Comment.created_at.desc())\
        .all()

    return [{
        "id": c.id,
        "text": c.text,
        "user": c.user.username,
        "avatar": c.user.avatar
    } for c in comments]
