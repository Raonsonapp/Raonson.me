from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
from models import User, Post

router = APIRouter(prefix="/search", tags=["Search"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/")
def search(q: str, db: Session = Depends(get_db)):
    users = db.query(User).filter(User.username.contains(q)).all()
    posts = db.query(Post).filter(Post.caption.contains(q)).all()
    return {"users": users, "posts": posts}
