from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import or_
from database import SessionLocal
from models.user import User
from models.post import Post

router = APIRouter(prefix="/search", tags=["Search"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/")
def search(q: str, db: Session = Depends(get_db)):
    users = (
        db.query(User)
        .filter(User.username.ilike(f"%{q}%"))
        .limit(20)
        .all()
    )

    posts = (
        db.query(Post)
        .filter(
            or_(
                Post.caption.ilike(f"%{q}%"),
                Post.image_url.ilike(f"%{q}%")
            )
        )
        .limit(30)
        .all()
    )

    return {
        "users": [
            {
                "id": u.id,
                "username": u.username
            } for u in users
        ],
        "posts": [
            {
                "id": p.id,
                "user_id": p.user_id,
                "image_url": p.image_url,
                "caption": p.caption
            } for p in posts
        ]
}
