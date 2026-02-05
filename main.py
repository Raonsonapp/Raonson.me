from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from sqlalchemy.orm import Session

from database import SessionLocal, engine, Base
from models import User
from security import hash_password, verify_password, create_access_token

app = FastAPI()

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}

@app.post("/auth/register")
def register(data: RegisterRequest, db: Session = Depends(get_db)):
    if db.query(User).filter(User.username == data.username).first():
        raise HTTPException(status_code=400, detail="User already exists")

    user = User(
        username=data.username,
        password=hash_password(data.password)
    )
    db.add(user)
    db.commit()
    db.refresh(user)

    return {
        "message": "Registered successfully",
        "id": user.id
    }

@app.post("/auth/login")
def login(data: LoginRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == data.username).first()

    if not user or not verify_password(data.password, user.password):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    token = create_access_token({"user_id": user.id})

    return {
        "access_token": token,
        "token_type": "bearer"
    }
