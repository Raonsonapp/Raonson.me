from pydantic import BaseModel
from datetime import datetime

class CommentCreate(BaseModel):
    text: str

class CommentOut(BaseModel):
    id: int
    post_id: int
    user_id: int
    text: str
    created_at: datetime
