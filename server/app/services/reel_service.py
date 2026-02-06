from datetime import datetime

REELS = []
REEL_ID = 1

def create_reel(user_id: int, video_url: str, caption: str | None):
    global REEL_ID
    reel = {
        "id": REEL_ID,
        "user_id": user_id,
        "video_url": video_url,
        "caption": caption,
        "views": 0,
        "created_at": datetime.utcnow()
    }
    REELS.append(reel)
    REEL_ID += 1
    return reel


def list_reels():
    return REELS


def add_view(reel_id: int):
    for reel in REELS:
        if reel["id"] == reel_id:
            reel["views"] += 1
            return reel
    return None
