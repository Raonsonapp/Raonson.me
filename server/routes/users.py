from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
from models import User, Post

router = APIRouter(prefix="/users", tags=["Users"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/{user_id}")
def profile(user_id: int, db: Session = Depends(get_db)):
    user = db.query(User).get(user_id)
    posts = db.query(Post).filter(Post.user_id == user_id).all()
    return {"user": user, "posts": posts}
