from fastapi import APIRouter, UploadFile, File, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, storage, auth

router = APIRouter(prefix="/upload", tags=["Upload"])
