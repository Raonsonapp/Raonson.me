from pydantic import BaseModel, EmailStr

class RegisterRequest(BaseModel):
    username: str
    email: EmailStr
    password: str

class RegisterResponse(BaseModel):
    id: int
    username: str
    email: str
class LoginRequest(BaseModel):
    email: EmailStr
    password: str

class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
class UserResponse(BaseModel):
    id: int
    username: str
    email: EmailStr

    class Config:
        orm_mode = True
class ProfileResponse(BaseModel):
    username: str
    bio: str
    avatar: str | None
    followers: int
    following: int
class PostCreate(BaseModel):
    caption: str
    media_url: str

class CommentCreate(BaseModel):
    post_id: int
    text: str
class StoryCreate(BaseModel):
    media_url: str
