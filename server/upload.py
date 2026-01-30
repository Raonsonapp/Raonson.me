from fastapi import APIRouter, UploadFile, File, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, storage, auth

router = APIRouter(prefix="/upload", tags=["Upload"])
@router.post("/post")
def upload_post(
    file: UploadFile = File(...),
    caption: str = "",
    db: Session = Depends(get_db),
    user = Depends(auth.get_current_user)
):
    path = storage.save_file(file)

    post = models.Post(
        user_id=user.id,
        media_url=path,
        caption=caption
    )

    db.add(post)
    db.commit()
@router.post("/reel")
def upload_reel(
    file: UploadFile = File(...),
    caption: str = "",
    db: Session = Depends(get_db),
    user = Depends(auth.get_current_user)
):
    path = storage.save_file(file)

    reel = models.Reel(
        user_id=user.id,
        video_url=path,
        caption=caption
    )

    db.add(reel)
    db.commit()
    return {"success": True}
  return {"success": True, "media_url": path}
@router.post("/story")
def upload_story(
    file: UploadFile = File(...),
    db: Session = Depends(get_db),
    user = Depends(auth.get_current_user)
):
    path = storage.save_file(file)

    story = models.Story(
        user_id=user.id,
        media_url=path
    )

    db.add(story)
    db.commit()
    return {"success": True}
