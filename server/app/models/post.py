from datetime import datetime

class Post:
    def __init__(
        self,
        id: int,
        user_id: int,
        caption: str,
        image_url: str
    ):
        self.id = id
        self.user_id = user_id
        self.caption = caption
        self.image_url = image_url
        self.created_at = datetime.utcnow()
