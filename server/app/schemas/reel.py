from pydantic import BaseModel
from datetime import datetime

class ReelCreate(BaseModel):
    video_url: str
    caption: str | None = None

class ReelOut(BaseModel):
    id: int
    user_id: int
    video_url: str
    caption: str | None
    views: int
    created_at: datetime
