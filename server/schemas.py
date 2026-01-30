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
class PostOut(BaseModel):
    id: int
    user_id: int
    media_url: str
    caption: str | None
    created_at: datetime

    class Config:
        orm_mode = True
class ReelOut(BaseModel):
    id: int
    user_id: int
    video_url: str
    caption: str | None
    views: int
    created_at: datetime

    class Config:
        orm_mode = True
class UploadResponse(BaseModel):
    success: bool
    media_url: str
