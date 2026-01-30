from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from datetime import datetime
from database import Base

class Story(Base):
    __tablename__ = "stories"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    media_url = Column(String)
    media_type = Column(String)  # image / video
    created_at = Column(DateTime, default=datetime.utcnow)
    views = Column(Integer, default=0)

    user = relationship("User")
