from sqlalchemy import Column, Integer, String, Boolean
from database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    username = Column(String, unique=True)
    avatar = Column(String, nullable=True)
    bio = Column(String, default="")
    is_verified = Column(Boolean, default=False)
