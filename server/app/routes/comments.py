from fastapi import APIRouter, HTTPException
from app.schemas.comment import CommentCreate, CommentOut
from app.services.comment_service import add_comment, list_comments

router = APIRouter(prefix="/posts", tags=["Comments"])

@router.post("/{post_id}/comments", response_model=CommentOut)
def create_comment(post_id: int, data: CommentCreate):
    # user_id ҳоло fake
    return add_comment(
        post_id=post_id,
        user_id=1,
        text=data.text
    )

@router.get("/{post_id}/comments", response_model=list[CommentOut])
def get_comments(post_id: int):
    return list_comments(post_id)
