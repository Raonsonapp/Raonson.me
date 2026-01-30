from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/reels", tags=["Reels"])
@router.get("/", response_model=list[schemas.ReelOut])
def get_reels(
    page: int = 1,
    limit: int = 10,
    db: Session = Depends(get_db)
):
    reels = db.query(models.Reel)\
        .order_by(models.Reel.created_at.desc())\
        .offset((page - 1) * limit)\
        .limit(limit)\
        .all()

    return reels
  @router.post("/{reel_id}/view")
def add_view(
    reel_id: int,
    db: Session = Depends(get_db)
):
    reel = db.query(models.Reel).get(reel_id)
    reel.views += 1
    db.commit()
    return {"views": reel.views}
