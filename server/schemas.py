from pydantic import BaseModel

class UserOut(BaseModel):
    id: int
    username: str
    bio: str

class PostOut(BaseModel):
    id: int
    user_id: int
    image: str
    caption: str

class ReelOut(BaseModel):
    id: int
    user_id: int
    video: str
    caption: str

class ChatOut(BaseModel):
    from_user: int
    to_user: int
    message: str
