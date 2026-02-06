from pydantic import BaseModel
from datetime import datetime

class PostCreate(BaseModel):
    caption: str
    image_url: str


class PostOut(BaseModel):
    id: int
    user_id: int
    caption: str
    image_url: str
    created_at: datetime
