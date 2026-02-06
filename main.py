from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from uuid import uuid4
from typing import List
from datetime import datetime
import uuid

# ===== IN-MEMORY DB =====
POSTS_DB = {}
COMMENTS_DB = {}

# ===== MODELS =====
class PostCreate(BaseModel):
    caption: str
    image_url: str

class CommentCreate(BaseModel):
    text: str

# ===== POSTS =====
@app.post("/posts")
async def create_post(post: PostCreate):
    post_id = str(uuid4())
    POSTS_DB[post_id] = {
        "id": post_id,
        "caption": post.caption,
        "image_url": post.image_url,
        "likes": 0
    }
    COMMENTS_DB[post_id] = []
    return POSTS_DB[post_id]

@app.get("/posts")
async def list_posts():
    return list(POSTS_DB.values())

@app.post("/posts/{post_id}/like")
async def like_post(post_id: str):
    if post_id not in POSTS_DB:
        raise HTTPException(status_code=404, detail="Post not found")
    POSTS_DB[post_id]["likes"] += 1
    return {
        "message": "Post liked",
        "post_id": post_id,
        "likes": POSTS_DB[post_id]["likes"]
    }

# ===== COMMENTS =====
@app.post("/posts/{post_id}/comments")
async def add_comment(post_id: str, comment: CommentCreate):
    if post_id not in POSTS_DB:
        raise HTTPException(status_code=404, detail="Post not found")

    comment_data = {
        "id": str(uuid4()),
        "text": comment.text
    }
    COMMENTS_DB[post_id].append(comment_data)
    return {
        "message": "Comment added",
        "comment": comment_data
    }

@app.get("/posts/{post_id}/comments")
async def get_comments(post_id: str):
    if post_id not in POSTS_DB:
        raise HTTPException(status_code=404, detail="Post not found")

    return COMMENTS_DB[post_id]
app = FastAPI()

# =====================
# MODELS
# =====================

class RegisterRequest(BaseModel):
    username: str
    password: str


class LoginRequest(BaseModel):
    username: str
    password: str


class PostCreate(BaseModel):
    caption: str
    image_url: str


class Post(PostCreate):
    id: str
    created_at: str
    likes: int = 0


# =====================
# FAKE DATABASE
# =====================

USERS = []
POSTS: List[Post] = []


# =====================
# ROOT
# =====================

@app.get("/")
async def root():
    return {"status": "Raonson server is running"}


@app.get("/health")
async def health():
    return {"health": "ok"}


# =====================
# AUTH
# =====================

@app.post("/auth/register")
async def register(data: RegisterRequest):
    USERS.append(data.username)
    return {
        "message": "User registered successfully",
        "username": data.username
    }


@app.post("/auth/login")
async def login(data: LoginRequest):
    if data.password != "123456":
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "message": "Login successful",
        "token": "fake-jwt-token"
    }


# =====================
# POSTS (CREATE + LIST)
# =====================

@app.post("/posts")
async def create_post(data: PostCreate):
    post = Post(
        id=str(uuid.uuid4()),
        caption=data.caption,
        image_url=data.image_url,
        created_at=datetime.utcnow().isoformat()
    )

    POSTS.append(post)
    return {
        "message": "Post created successfully",
        "post": post
    }


@app.get("/posts")
async def list_posts():
    return {
        "count": len(POSTS),
        "posts": POSTS
                            }
@app.post("/posts/{post_id}/like")
async def like_post(post_id: str):
    for post in POSTS:
        if post.id == post_id:
            post.likes += 1
            return {
                "message": "Post liked",
                "post_id": post_id,
                "likes": post.likes
            }

    raise HTTPException(status_code=404, detail="Post not found")
