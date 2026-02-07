from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uuid

app = FastAPI()

# ===== FAKE DATABASE =====
users_db = {}

# ===== MODELS =====
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

# ===== ROOT =====
@app.get("/")
def root():
    return {"status": "Raonson API running"}

@app.get("/health")
def health():
    return {"health": "ok"}

# ===== AUTH =====
@app.post("/auth/register")
def register(data: RegisterRequest):
    if data.username in users_db:
        raise HTTPException(status_code=400, detail="User already exists")

    users_db[data.username] = {
        "password": data.password
    }

    return {
        "message": "Registered successfully"
    }

@app.post("/auth/login")
def login(data: LoginRequest):
    user = users_db.get(data.username)

    if not user or user["password"] != data.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")

    token = str(uuid.uuid4())

    return {
        "token": token,
        "username": data.username
    }
