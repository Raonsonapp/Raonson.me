from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import User, Post

router = APIRouter(prefix="/search", tags=["Search"])
@router.get("/users")
def search_users(q: str, db: Session = Depends(get_db)):
    users = db.query(User)\
        .filter(User.username.ilike(f"%{q}%"))\
        .limit(20)\
        .all()

    return [{
        "id": u.id,
        "username": u.username,
        "avatar": u.avatar,
        "verified": u.is_verified
    } for u in users]
  @router.get("/explore")
def explore_posts(db: Session = Depends(get_db)):
    posts = db.query(Post)\
        .order_by(Post.created_at.desc())\
        .limit(50)\
        .all()

    return [{
        "id": p.id,
        "media": p.media_url,
        "likes": p.likes_count
    } for p in posts]
  @router.get("/trending")
def trending_posts(db: Session = Depends(get_db)):
    posts = db.query(Post)\
        .order_by(Post.likes_count.desc())\
        .limit(30)\
        .all()

    return [{
        "id": p.id,
        "media": p.media_url,
        "likes": p.likes_count
    } for p in posts]
