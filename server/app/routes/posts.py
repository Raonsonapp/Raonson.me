from fastapi import APIRouter, HTTPException
from app.schemas.post import PostCreate, PostOut
from datetime import datetime

router = APIRouter(prefix="/posts", tags=["Posts"])

# FAKE STORAGE
POSTS = []
POST_ID = 1

@router.post("", response_model=PostOut)
def create_post(data: PostCreate):
    global POST_ID

    post = {
        "id": POST_ID,
        "user_id": 1,  # ҳоло fake
        "caption": data.caption,
        "image_url": data.image_url,
        "created_at": datetime.utcnow()
    }

    POSTS.append(post)
    POST_ID += 1

    return post


@router.get("", response_model=list[PostOut])
def list_posts():
    return POSTS
