from pydantic import BaseModel
from uuid import UUID
from datetime import datetime
from typing import List

class MessageCreate(BaseModel):
    to_user_id: UUID
    text: str

class MessageOut(BaseModel):
    id: UUID
    sender_id: UUID
    text: str
    created_at: datetime
