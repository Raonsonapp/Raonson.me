from fastapi import APIRouter, Query
from app.services.search_service import search_all

router = APIRouter(prefix="/search", tags=["Search"])

@router.get("")
def search(q: str = Query(..., min_length=1)):
    return search_all(q)
