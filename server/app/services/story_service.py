from datetime import datetime, timedelta

STORIES = []
STORY_ID = 1

def create_story(user_id: int, media_url: str):
    global STORY_ID
    story = {
        "id": STORY_ID,
        "user_id": user_id,
        "media_url": media_url,
        "created_at": datetime.utcnow(),
        "expires_at": datetime.utcnow() + timedelta(hours=24)
    }
    STORIES.append(story)
    STORY_ID += 1
    return story


def list_active_stories():
    now = datetime.utcnow()
    return [s for s in STORIES if s["expires_at"] > now]
