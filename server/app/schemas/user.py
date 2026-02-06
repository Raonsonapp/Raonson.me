from pydantic import BaseModel
from datetime import datetime

class UserOut(BaseModel):
    id: int
    username: str
    bio: str | None = None
    avatar_url: str | None = None
    followers: int
    following: int
    created_at: datetime


class UserUpdate(BaseModel):
    bio: str | None = None
    avatar_url: str | None = None
