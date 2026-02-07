from fastapi import FastAPI, HTTPException, WebSocket, WebSocketDisconnect
from pydantic import BaseModel
from typing import List, Dict

app = FastAPI()

# ===== DATABASE (IN-MEMORY) =====
users: Dict[str, str] = {}
posts = []
likes = {}
connections = {}

# ===== MODELS =====
class Auth(BaseModel):
    username: str
    password: str

class Post(BaseModel):
    id: int
    username: str
    caption: str

# ===== AUTH =====
@app.post("/auth/register")
def register(data: Auth):
    if data.username in users:
        raise HTTPException(400, "User exists")
    users[data.username] = data.password
    return {"ok": True}

@app.post("/auth/login")
def login(data: Auth):
    if users.get(data.username) != data.password:
        raise HTTPException(401, "Invalid")
    return {"token": data.username}

# ===== POSTS =====
@app.get("/posts")
def get_posts():
    return posts

@app.post("/posts")
def create_post(post: Dict):
    pid = len(posts) + 1
    posts.append({
        "id": pid,
        "username": post.get("username"),
        "caption": post.get("caption"),
    })
    likes[pid] = 0
    return {"ok": True}

@app.post("/posts/{pid}/like")
def like_post(pid: int):
    likes[pid] += 1
    return {"likes": likes[pid]}

# ===== CHAT (REALTIME) =====
@app.websocket("/ws/chat/{user}")
async def chat(ws: WebSocket, user: str):
    await ws.accept()
    connections[user] = ws
    try:
        while True:
            data = await ws.receive_text()
            to, msg = data.split(":", 1)
            if to in connections:
                await connections[to].send_text(f"{user}:{msg}")
    except WebSocketDisconnect:
        connections.pop(user, None)
