from sqlalchemy import Column, Integer
from database import Base

class Follow(Base):
    __tablename__ = "follows"

    id = Column(Integer, primary_key=True)
    follower_id = Column(Integer)
    following_id = Column(Integer)
