from pydantic import BaseModel
from datetime import datetime

class MessageCreate(BaseModel):
    text: str

class MessageOut(BaseModel):
    id: int
    from_user: int
    to_user: int
    text: str
    created_at: datetime
