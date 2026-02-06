from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
from models import Chat

router = APIRouter(prefix="/chats", tags=["Chats"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/{user_id}")
def get_chats(user_id: int, db: Session = Depends(get_db)):
    return db.query(Chat).filter(
        (Chat.from_user == user_id) | (Chat.to_user == user_id)
    ).all()
