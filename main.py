from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(title="Raonson API")

# ======================
# FAKE DATABASE (TEMP)
# ======================
fake_users_db = []

# ======================
# MODELS
# ======================
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

# ======================
# ROOT & HEALTH
# ======================
@app.get("/")
async def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
async def health():
    return {"health": "ok"}

# ======================
# AUTH
# ======================
@app.post("/auth/register")
async def register(data: RegisterRequest):
    for user in fake_users_db:
        if user["username"] == data.username:
            raise HTTPException(status_code=400, detail="Username already exists")

    fake_users_db.append({
        "username": data.username,
        "password": data.password
    })

    return {
        "message": "User registered successfully",
        "username": data.username
    }

@app.post("/auth/login")
async def login(data: LoginRequest):
    for user in fake_users_db:
        if user["username"] == data.username and user["password"] == data.password:
            return {
                "message": "Login successful",
                "token": "fake-jwt-token"
            }

    raise HTTPException(status_code=401, detail="Invalid credentials")
