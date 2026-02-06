from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
from models.conversation import Conversation
from models.message import Message
from jose import jwt
from schemas.chat import MessageCreate

router = APIRouter(prefix="/chat", tags=["Chat"])

SECRET_KEY = "RAONSON_SECRET_KEY_CHANGE_LATER"
ALGORITHM = "HS256"

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_user_id(token: str):
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    return payload["user_id"]

# ===== GET CONVERSATIONS =====
@router.get("/conversations")
def conversations(token: str, db: Session = Depends(get_db)):
    user_id = get_user_id(token)

    return db.query(Conversation).filter(
        (Conversation.user1_id == user_id) |
        (Conversation.user2_id == user_id)
    ).all()

# ===== SEND MESSAGE =====
@router.post("/send")
def send_message(
    data: MessageCreate,
    token: str,
    db: Session = Depends(get_db)
):
    user_id = get_user_id(token)

    convo = db.query(Conversation).filter(
        ((Conversation.user1_id == user_id) & (Conversation.user2_id == data.to_user_id)) |
        ((Conversation.user1_id == data.to_user_id) & (Conversation.user2_id == user_id))
    ).first()

    if not convo:
        convo = Conversation(
            user1_id=user_id,
            user2_id=data.to_user_id
        )
        db.add(convo)
        db.commit()
        db.refresh(convo)

    message = Message(
        conversation_id=convo.id,
        sender_id=user_id,
        text=data.text
    )
    db.add(message)
    db.commit()

    return {"message": "sent"}

# ===== GET MESSAGES =====
@router.get("/{conversation_id}/messages")
def messages(conversation_id: str, token: str, db: Session = Depends(get_db)):
    get_user_id(token)  # validate token

    return (
        db.query(Message)
        .filter(Message.conversation_id == conversation_id)
        .order_by(Message.created_at)
        .all()
      )
