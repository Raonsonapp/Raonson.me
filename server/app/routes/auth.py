from fastapi import APIRouter, HTTPException
from app.schemas.auth import RegisterRequest, LoginRequest
from app.services.auth_service import register_user, login_user

router = APIRouter(prefix="/auth", tags=["Auth"])

@router.post("/register")
def register(data: RegisterRequest):
    user = register_user(data.username, data.password)
    if not user:
        raise HTTPException(status_code=400, detail="Username already exists")

    return {
        "message": "User registered",
        "user_id": user["id"],
        "username": user["username"]
    }


@router.post("/login")
def login(data: LoginRequest):
    user = login_user(data.username, data.password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "message": "Login successful",
        "user_id": user["id"]
    }
