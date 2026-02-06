from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
from models.user import User
from models.post import Post
from jose import jwt

router = APIRouter(prefix="/profile", tags=["Profile"])

SECRET_KEY = "RAONSON_SECRET_KEY_CHANGE_LATER"
ALGORITHM = "HS256"

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_user_id(token: str):
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    return payload["user_id"]

# ===== MY PROFILE =====
@router.get("/me")
def my_profile(token: str, db: Session = Depends(get_db)):
    user_id = get_user_id(token)

    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(404, "User not found")

    posts_count = db.query(Post).filter(Post.user_id == user_id).count()

    return {
        "id": user.id,
        "username": user.username,
        "created_at": user.created_at,
        "posts_count": posts_count
    }

# ===== USER POSTS =====
@router.get("/{user_id}/posts")
def user_posts(user_id: str, db: Session = Depends(get_db)):
    posts = (
        db.query(Post)
        .filter(Post.user_id == user_id)
        .order_by(Post.created_at.desc())
        .all()
    )
    return posts
