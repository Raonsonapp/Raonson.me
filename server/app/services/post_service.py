# Business logic for posts
from datetime import datetime

POSTS = []
POST_ID = 1

def create_post(user_id: int, caption: str, image_url: str):
    global POST_ID

    post = {
        "id": POST_ID,
        "user_id": user_id,
        "caption": caption,
        "image_url": image_url,
        "created_at": datetime.utcnow()
    }

    POSTS.append(post)
    POST_ID += 1
    return post


def list_posts():
    return POSTS
