from fastapi import APIRouter, HTTPException
from auth.auth_models import RegisterRequest, LoginRequest
from auth.auth_service import register_user, login_user

router = APIRouter(prefix="/auth", tags=["Auth"])


@router.post("/register")
def register(data: RegisterRequest):
    user = register_user(
        email=data.email,
        password=data.password,
        username=data.username
    )

    if not user:
        raise HTTPException(status_code=400, detail="User already exists")

    return {
        "message": "User registered successfully",
        "user": user
    }


@router.post("/login")
def login(data: LoginRequest):
    user = login_user(
        email=data.email,
        password=data.password
    )

    if not user:
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "message": "Login successful",
        "user": user
    }
