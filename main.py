from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from sqlalchemy.orm import Session

from database import SessionLocal, engine
from models import User
from database import Base

app = FastAPI()

# CREATE TABLES
Base.metadata.create_all(bind=engine)

# DEPENDENCY
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# ===== SCHEMAS =====
class RegisterRequest(BaseModel):
    username: str
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

# ===== ROOT =====
@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}

# ===== AUTH =====
@app.post("/auth/register")
def register(data: RegisterRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == data.username).first()
    if user:
        raise HTTPException(status_code=400, detail="User already exists")

    new_user = User(
        username=data.username,
        password=data.password  # ҳоло plain, баъд hash мекунем
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return {
        "message": "User registered successfully",
        "id": new_user.id,
        "username": new_user.username
    }

@app.post("/auth/login")
def login(data: LoginRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == data.username).first()

    if not user or user.password != data.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "message": "Login successful",
        "user_id": user.id
        }
