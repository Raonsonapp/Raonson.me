from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
from models.post import Post
from schemas.post import PostCreate
from utils.jwt import create_token
from jose import jwt

router = APIRouter(prefix="/posts", tags=["Posts"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

SECRET_KEY = "RAONSON_SECRET_KEY_CHANGE_LATER"
ALGORITHM = "HS256"

def get_user_id(token: str):
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    return payload["user_id"]

@router.post("/")
def create_post(
    data: PostCreate,
    token: str,
    db: Session = Depends(get_db)
):
    user_id = get_user_id(token)

    post = Post(
        user_id=user_id,
        image_url=data.image_url,
        caption=data.caption,
    )
    db.add(post)
    db.commit()
    db.refresh(post)

    return post

@router.get("/feed")
def get_feed(db: Session = Depends(get_db)):
    return db.query(Post).order_by(Post.created_at.desc()).all()
