from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from datetime import datetime

app = FastAPI()

# ===== MODELS =====
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

class PostCreate(BaseModel):
    title: str
    image_url: str
    description: str

class Post(BaseModel):
    id: int
    title: str
    image_url: str
    description: str
    created_at: datetime


# ===== STORAGE (TEMP) =====
posts_db: List[Post] = []


# ===== ROOT =====
@app.get("/")
async def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
async def health():
    return {"health": "ok"}


# ===== AUTH =====
@app.post("/auth/register")
async def register(data: RegisterRequest):
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


# ===== POSTS =====
@app.post("/posts", response_model=Post)
async def create_post(data: PostCreate):
    post = Post(
        id=len(posts_db) + 1,
        title=data.title,
        image_url=data.image_url,
        description=data.description,
        created_at=datetime.utcnow()
    )
    posts_db.append(post)
    return post


@app.get("/posts", response_model=List[Post])
async def list_posts():
    return posts_db
