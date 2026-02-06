from datetime import datetime, timedelta
from jose import jwt

SECRET_KEY = "RAONSON_SECRET_KEY_CHANGE_LATER"
ALGORITHM = "HS256"
EXPIRE_MINUTES = 60 * 24

def create_token(data: dict):
    payload = data.copy()
    payload["exp"] = datetime.utcnow() + timedelta(minutes=EXPIRE_MINUTES)
    return jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM)
