from fastapi import APIRouter, HTTPException
from app.schemas.auth import RegisterRequest, LoginRequest

router = APIRouter(prefix="/auth", tags=["Auth"])

# FAKE STORAGE (муваққатӣ)
FAKE_USERS = []

@router.post("/register")
def register(data: RegisterRequest):
    for user in FAKE_USERS:
        if user["username"] == data.username:
            raise HTTPException(status_code=400, detail="Username already exists")

    FAKE_USERS.append({
        "username": data.username,
        "password": data.password
    })

    return {
        "message": "User registered",
        "username": data.username
    }


@router.post("/login")
def login(data: LoginRequest):
    for user in FAKE_USERS:
        if user["username"] == data.username and user["password"] == data.password:
            return {
                "message": "Login successful",
                "token": "fake-token"
            }

    raise HTTPException(status_code=401, detail="Invalid credentials")
