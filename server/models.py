from sqlalchemy import Column, Integer, String, Boolean
from database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True, nullable=False)
    email = Column(String, unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    is_verified = Column(Boolean, default=False)
class Profile(Base):
    __tablename__ = "profiles"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"), unique=True)
    avatar = Column(String, nullable=True)
    bio = Column(String, default="")
class Follow(Base):
    __tablename__ = "follows"

    id = Column(Integer, primary_key=True)
    follower_id = Column(Integer, ForeignKey("users.id"))
    following_id = Column(Integer, ForeignKey("users.id"))
class Post(Base):
    __tablename__ = "posts"
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    media_url = Column(String)
    caption = Column(String)
    post_type = Column(String)  # post | reel | gallery
    created_at = Column(DateTime, default=datetime.utcnow)
class Like(Base):
    __tablename__ = "likes"
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    post_id = Column(Integer, ForeignKey("posts.id"))

class Comment(Base):
    __tablename__ = "comments"
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    post_id = Column(Integer, ForeignKey("posts.id"))
    text = Column(String)
    created_at = Column(DateTime, default=datetime.utcnow)
class Story(Base):
    __tablename__ = "stories"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    media_url = Column(String, nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)
class StoryView(Base):
    __tablename__ = "story_views"
    id = Column(Integer, primary_key=True)
    story_id = Column(Integer, ForeignKey("stories.id"))
    user_id = Column(Integer, ForeignKey("users.id"))
class Reel(Base):
    __tablename__ = "reels"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    video_url = Column(String)
    caption = Column(String, nullable=True)
    views = Column(Integer, default=0)
    created_at = Column(DateTime, default=datetime.utcnow)
