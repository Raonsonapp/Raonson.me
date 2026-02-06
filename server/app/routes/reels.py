from fastapi import APIRouter, HTTPException
from app.schemas.reel import ReelCreate, ReelOut
from app.services.reel_service import create_reel, list_reels, add_view

router = APIRouter(prefix="/reels", tags=["Reels"])

@router.post("", response_model=ReelOut)
def create(data: ReelCreate):
    return create_reel(
        user_id=1,  # fake user
        video_url=data.video_url,
        caption=data.caption
    )

@router.get("", response_model=list[ReelOut])
def list_all():
    return list_reels()

@router.post("/{reel_id}/view", response_model=ReelOut)
def view(reel_id: int):
    reel = add_view(reel_id)
    if not reel:
        raise HTTPException(status_code=404, detail="Reel not found")
    return reel
