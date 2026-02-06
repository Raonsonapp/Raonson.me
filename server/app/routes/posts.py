from fastapi import APIRouter
from app.schemas.post import PostCreate, PostOut
from app.services.post_service import create_post, list_posts
from app.services.like_service import like_post, get_likes

router = APIRouter(prefix="/posts", tags=["Posts"])

@router.post("", response_model=PostOut)
def create(data: PostCreate):
    post = create_post(
        user_id=1,  # ҳоло fake
        caption=data.caption,
        image_url=data.image_url
    )
    return post


@router.get("", response_model=list[PostOut])
def list_all():
    return list_posts()
@router.post("/{post_id}/like")
def like(post_id: int):
    count = like_post(post_id)
    return {
        "post_id": post_id,
        "likes": count
    }

@router.get("/{post_id}/likes")
def likes(post_id: int):
    return {
        "post_id": post_id,
        "likes": get_likes(post_id)
    }
