from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from models.follow import Follow
from auth import get_current_user

router = APIRouter(prefix="/follow", tags=["Follow"])
