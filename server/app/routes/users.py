from fastapi import APIRouter, HTTPException
from app.schemas.user import UserOut, UserUpdate
from app.services.user_service import (
    get_user, update_user,
    follow, unfollow,
    followers_count, following_count
)

router = APIRouter(prefix="/users", tags=["Users"])

@router.get("/{user_id}", response_model=UserOut)
def get_profile(user_id: int):
    user = get_user(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    return {
        **user,
        "followers": followers_count(user_id),
        "following": following_count(user_id)
    }


@router.put("/me", response_model=UserOut)
def update_profile(data: UserUpdate):
    # user_id ҳоло fake
    user_id = 1
    user = update_user(user_id, data.bio, data.avatar_url)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    return {
        **user,
        "followers": followers_count(user_id),
        "following": following_count(user_id)
    }


@router.post("/{user_id}/follow")
def follow_user(user_id: int):
    follower_id = 1  # fake current user
    if not follow(follower_id, user_id):
        raise HTTPException(status_code=400, detail="Cannot follow yourself")

    return {"message": "Followed"}


@router.post("/{user_id}/unfollow")
def unfollow_user(user_id: int):
    follower_id = 1
    unfollow(follower_id, user_id)
    return {"message": "Unfollowed"}
