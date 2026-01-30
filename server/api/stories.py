from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Story, StoryView
from datetime import datetime

router = APIRouter(prefix="/stories", tags=["Stories"])
@router.post("/upload")
def upload_story(user_id: int, media_url: str, db: Session = Depends(get_db)):
    story = Story(
        user_id=user_id,
        media_url=media_url,
        created_at=datetime.utcnow()
    )
    db.add(story)
    db.commit()
    return {"status": "story_uploaded"}
  @router.get("/")
def get_stories(db: Session = Depends(get_db)):
    from datetime import timedelta

    time_limit = datetime.utcnow() - timedelta(hours=24)
    stories = db.query(Story).filter(Story.created_at >= time_limit).all()

    result = []
    for s in stories:
        views = db.query(StoryView).filter(StoryView.story_id == s.id).count()
        result.append({
            "id": s.id,
            "user_id": s.user_id,
            "media_url": s.media_url,
            "views": views,
            "created_at": s.created_at
        })
    return result
  @router.post("/{story_id}/view")
def view_story(story_id: int, user_id: int, db: Session = Depends(get_db)):
    exists = db.query(StoryView).filter_by(
        story_id=story_id,
        user_id=user_id
    ).first()

    if exists:
        return {"status": "already_viewed"}

    view = StoryView(
        story_id=story_id,
        user_id=user_id
    )
    db.add(view)
    db.commit()
    return {"status": "view_added"}
