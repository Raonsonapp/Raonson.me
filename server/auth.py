from sqlalchemy.orm import Session
from passlib.context import CryptContext
import models, schemas

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def hash_password(password: str) -> str:
    return pwd_context.hash(password)

def create_user(db: Session, data: schemas.RegisterRequest):
    # CHECK USERNAME
    if db.query(models.User).filter(models.User.username == data.username).first():
        raise ValueError("USERNAME_EXISTS")

    # CHECK EMAIL
    if db.query(models.User).filter(models.User.email == data.email).first():
        raise ValueError("EMAIL_EXISTS")

    user = models.User(
        username=data.username,
        email=data.email,
        hashed_password=hash_password(data.password)
    )

    db.add(user)
    db.commit()
    db.refresh(user)
    return user
