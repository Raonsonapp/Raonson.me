from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
from database import get_db
from models.story import Story
from auth import get_current_user

router = APIRouter(prefix="/stories", tags=["Stories"])
@router.post("/")
def add_story(media_url: str,
              media_type: str,
              db: Session = Depends(get_db),
              user = Depends(get_current_user)):

    story = Story(
        user_id=user.id,
        media_url=media_url,
        media_type=media_type
    )
    db.add(story)
    db.commit()
    return {"success": True}
@router.get("/")
def get_stories(db: Session = Depends(get_db)):
    limit_time = datetime.utcnow() - timedelta(hours=24)

    stories = db.query(Story)\
        .filter(Story.created_at >= limit_time)\
        .all()

    return [{
        "id": s.id,
        "user_id": s.user_id,
        "username": s.user.username,
        "avatar": s.user.avatar,
        "media": s.media_url,
        "type": s.media_type,
        "views": s.views
    } for s in stories]
@router.post("/view/{story_id}")
def view_story(story_id: int, db: Session = Depends(get_db)):
    story = db.query(Story).filter_by(id=story_id).first()
    if not story:
        return {"error": "Story not found"}

    story.views += 1
    db.commit()
    return {"views": story.views}
    
