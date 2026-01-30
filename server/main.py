from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session

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
