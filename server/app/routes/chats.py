from fastapi import APIRouter
from app.schemas.chat import MessageCreate, MessageOut
from app.services.chat_service import send_message, get_messages

router = APIRouter(prefix="/chats", tags=["Chats"])

@router.post("/{user_id}", response_model=MessageOut)
def send(user_id: int, data: MessageCreate):
    return send_message(
        from_user=1,   # fake current user
        to_user=user_id,
        text=data.text
    )

@router.get("/{user_id}", response_model=list[MessageOut])
def history(user_id: int):
    return get_messages(1, user_id)
