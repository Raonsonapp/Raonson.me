from pydantic import BaseModel
from datetime import datetime

class StoryCreate(BaseModel):
    media_url: str

class StoryOut(BaseModel):
    id: int
    user_id: int
    media_url: str
    created_at: datetime
