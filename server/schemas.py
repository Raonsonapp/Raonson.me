from pydantic import BaseModel

class UserOut(BaseModel):
    id: int
    username: str

class PostOut(BaseModel):
    id: int
    image: str
    caption: str

class ReelOut(BaseModel):
    id: int
    video: str
    caption: str

class ChatOut(BaseModel):
    from_user: int
    to_user: int
    message: str
