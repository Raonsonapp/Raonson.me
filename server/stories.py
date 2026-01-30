from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
from .database import get_db
from . import models, schemas, auth

router = APIRouter(prefix="/stories", tags=["Stories"])
@router.post("/")
def add_story(
    data: schemas.StoryCreate,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    story = models.Story(
        user_id=current_user.id,
        media_url=data.media_url
    )
    db.add(story)
    db.commit()
    return {"status": "story_added"}
 @router.get("/")
def get_stories(db: Session = Depends(get_db)):
    limit_time = datetime.utcnow() - timedelta(hours=24)
    stories = db.query(models.Story)\
        .filter(models.Story.created_at >= limit_time)\
        .all()
    return stories
@router.post("/{story_id}/view")
def view_story(
    story_id: int,
    current_user=Depends(auth.get_current_user),
    db: Session = Depends(get_db)
):
    exists = db.query(models.StoryView).filter(
        models.StoryView.story_id == story_id,
        models.StoryView.user_id == current_user.id
    ).first()
    if exists:
        return {"viewed": True}

    view = models.StoryView(
        story_id=story_id,
        user_id=current_user.id
    )
    db.add(view)
    db.commit()
    return {"viewed": True}
