from sqlalchemy import Column, Text, DateTime, ForeignKey
from sqlalchemy.dialects.postgresql import UUID
from database import Base
import uuid
from datetime import datetime

class Post(Base):
    __tablename__ = "posts"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    image_url = Column(Text, nullable=False)
    caption = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)
