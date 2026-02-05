from fastapi import APIRouter
from .schemas import RegisterSchema, LoginSchema
from .service import register_user, login_user

router = APIRouter(prefix="/auth", tags=["Auth"])

@router.post("/register")
def register(data: RegisterSchema):
    return register_user(data.dict())

@router.post("/login")
def login(data: LoginSchema):
    return login_user(data.dict())
