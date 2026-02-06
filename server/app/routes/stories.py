from fastapi import APIRouter
from app.schemas.story import StoryCreate, StoryOut
from app.services.story_service import create_story, list_active_stories

router = APIRouter(prefix="/stories", tags=["Stories"])

@router.post("", response_model=StoryOut)
def create(data: StoryCreate):
    return create_story(
        user_id=1,  # fake user
        media_url=data.media_url
    )

@router.get("", response_model=list[StoryOut])
def list_all():
    return list_active_stories()
