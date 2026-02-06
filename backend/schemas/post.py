from pydantic import BaseModel
from uuid import UUID
from datetime import datetime

class PostCreate(BaseModel):
    image_url: str
    caption: str

class PostOut(BaseModel):
    id: UUID
    user_id: UUID
    image_url: str
    caption: str
    created_at: datetime
