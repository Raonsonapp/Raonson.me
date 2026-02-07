from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uuid

app = FastAPI()

users = {}
sessions = {}

class AuthRequest(BaseModel):
    username: str
    password: str

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/auth/register")
def register(data: AuthRequest):
    if data.username in users:
        raise HTTPException(status_code=400, detail="User exists")
    users[data.username] = data.password
    token = str(uuid.uuid4())
    sessions[token] = data.username
    return {
        "token": token,
        "user": {"username": data.username}
    }

@app.post("/auth/login")
def login(data: AuthRequest):
    if users.get(data.username) != data.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    token = str(uuid.uuid4())
    sessions[token] = data.username
    return {
        "token": token,
        "user": {"username": data.username}
    }

@app.get("/me")
def me(token: str):
    if token not in sessions:
        raise HTTPException(status_code=401)
    return {"username": sessions[token]}
from fastapi import FastAPI, WebSocket, WebSocketDisconnect

app = FastAPI()

connections = {}

@app.websocket("/ws/chat/{username}")
async def chat_ws(ws: WebSocket, username: str):
    await ws.accept()
    connections[username] = ws
    try:
        while True:
            data = await ws.receive_text()
            # формати содда: "to:message"
            to, msg = data.split(":", 1)
            if to in connections:
                await connections[to].send_text(f"{username}:{msg}")
    except WebSocketDisconnect:
        connections.pop(username, None)
