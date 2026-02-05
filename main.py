from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from datetime import datetime
import uuid

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
