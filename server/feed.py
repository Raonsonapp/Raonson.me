from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/feed", tags=["Feed"])
