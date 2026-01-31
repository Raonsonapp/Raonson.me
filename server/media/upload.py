from fastapi import APIRouter, UploadFile, File
from .storage import save_file

router = APIRouter(prefix="/media", tags=["Media"])

@router.post("/upload")
async def upload_media(file: UploadFile = File(...)):
    url = save_file(file)
    return {"media_url": url}
