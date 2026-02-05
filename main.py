from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

# ===== MODELS =====
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str


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
