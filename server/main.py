from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from .profile import router as profile_router

import models, schemas, auth
from database import engine, SessionLocal

models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Raonson API")

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def root():
    return {"status": "Raonson server is alive ✅"}

@app.post("/auth/register", response_model=schemas.RegisterResponse)
def register(data: schemas.RegisterRequest, db: Session = Depends(get_db)):
    try:
        user = auth.create_user(db, data)
        return user
    except ValueError as e:
        if str(e) == "USERNAME_EXISTS":
            raise HTTPException(status_code=400, detail="Username already exists")
        if str(e) == "EMAIL_EXISTS":
            raise HTTPException(status_code=400, detail="Email already exists")
        raise HTTPException(status_code=400, detail="Registration failed")
@app.post("/auth/login", response_model=schemas.TokenResponse)
def login(data: schemas.LoginRequest, db: Session = Depends(get_db)):
    user = auth.authenticate_user(db, data.email, data.password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid email or password")

    token = auth.create_access_token({
        "user_id": user.id,
        "username": user.username
    })

    return {"access_token": token}
@app.get("/auth/me", response_model=schemas.UserResponse)
def read_me(current_user: models.User = Depends(auth.get_current_user)):
    return current_user
