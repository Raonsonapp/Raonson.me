from pydantic import BaseModel
from uuid import UUID
from datetime import datetime
from typing import List

class UserProfileOut(BaseModel):
    id: UUID
    username: str
    created_at: datetime
    posts_count: int
