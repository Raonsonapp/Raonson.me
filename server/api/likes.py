from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Like, Post
from auth import get_current_user

router = APIRouter(prefix="/likes", tags=["Likes"])
@router.post("/{post_id}")
def toggle_like(post_id: int,
                db: Session = Depends(get_db),
                user = Depends(get_current_user)):

    like = db.query(Like)\
        .filter_by(post_id=post_id, user_id=user.id)\
        .first()

    post = db.query(Post).filter_by(id=post_id).first()

    if like:
        db.delete(like)
        post.likes_count -= 1
        db.commit()
        return {"liked": False}

    new_like = Like(post_id=post_id, user_id=user.id)
    db.add(new_like)
    post.likes_count += 1
    db.commit()
    return {"liked": True}
