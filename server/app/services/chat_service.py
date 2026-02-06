from datetime import datetime

MESSAGES = []
MESSAGE_ID = 1

def send_message(from_user: int, to_user: int, text: str):
    global MESSAGE_ID
    msg = {
        "id": MESSAGE_ID,
        "from_user": from_user,
        "to_user": to_user,
        "text": text,
        "created_at": datetime.utcnow()
    }
    MESSAGES.append(msg)
    MESSAGE_ID += 1
    return msg


def get_messages(user1: int, user2: int):
    return [
        m for m in MESSAGES
        if (m["from_user"] == user1 and m["to_user"] == user2)
        or (m["from_user"] == user2 and m["to_user"] == user1)
    ]
