from datetime import datetime

class Reel:
    def __init__(self, id: int, user_id: int, video_url: str, caption: str):
        self.id = id
        self.user_id = user_id
        self.video_url = video_url
        self.caption = caption
        self.views = 0
        self.created_at = datetime.utcnow()
