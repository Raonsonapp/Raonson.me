from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
from models import Reel

router = APIRouter(prefix="/reels", tags=["Reels"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/")
def get_reels(db: Session = Depends(get_db)):
    return db.query(Reel).all()
