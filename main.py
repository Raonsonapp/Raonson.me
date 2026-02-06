from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from datetime import datetime

app = FastAPI(title="Raonson API", version="1.0")

# ===== IN-MEMORY STORAGE (v1) =====
users = []
posts = []
messages = []

# ===== MODELS =====
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

class UserProfile(BaseModel):
    username: str
    bio: str = ""
    avatar: str = ""

class PostCreate(BaseModel):
    username: str
    caption: str
    image_url: str

class Post(BaseModel):
    id: int
    username: str
    caption: str
    image_url: str
    created_at: str

class MessageCreate(BaseModel):
    from_user: str
    to_user: str
    text: str

# ===== ROOT =====
@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}

# ===== AUTH =====
@app.post("/auth/register")
def register(data: RegisterRequest):
    for u in users:
        if u["username"] == data.username:
            raise HTTPException(status_code=400, detail="User already exists")

    users.append({
        "username": data.username,
        "password": data.password,
        "bio": "",
        "avatar": ""
    })
    return {"message": "Registered successfully"}

@app.post("/auth/login")
def login(data: LoginRequest):
    for u in users:
        if u["username"] == data.username and u["password"] == data.password:
            return {"message": "Login successful"}
    raise HTTPException(status_code=401, detail="Invalid credentials")

# ===== PROFILE =====
@app.get("/profile/{username}", response_model=UserProfile)
def get_profile(username: str):
    for u in users:
        if u["username"] == username:
            return {
                "username": u["username"],
                "bio": u["bio"],
                "avatar": u["avatar"]
            }
    raise HTTPException(status_code=404, detail="User not found")

# ===== POSTS =====
@app.post("/posts", response_model=Post)
def create_post(data: PostCreate):
    post_id = len(posts) + 1
    post = {
        "id": post_id,
        "username": data.username,
        "caption": data.caption,
        "image_url": data.image_url,
        "created_at": datetime.utcnow().isoformat()
    }
    posts.append(post)
    return post

@app.get("/posts", response_model=List[Post])
def list_posts():
    return posts[::-1]

# ===== SEARCH =====
@app.get("/search")
def search(q: str):
    found_users = [u["username"] for u in users if q.lower() in u["username"].lower()]
    found_posts = [p for p in posts if q.lower() in p["caption"].lower()]
    return {
        "users": found_users,
        "posts": found_posts
    }

# ===== CHAT =====
@app.post("/chat/send")
def send_message(data: MessageCreate):
    messages.append({
        "from": data.from_user,
        "to": data.to_user,
        "text": data.text,
        "time": datetime.utcnow().isoformat()
    })
    return {"message": "Sent"}

@app.get("/chat/{user1}/{user2}")
def get_chat(user1: str, user2: str):
    chat = [
        m for m in messages
        if (m["from"] == user1 and m["to"] == user2) or
           (m["from"] == user2 and m["to"] == user1)
    ]
    return chat
