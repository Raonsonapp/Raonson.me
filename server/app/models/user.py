from datetime import datetime

class User:
    def __init__(self, id: int, username: str):
        self.id = id
        self.username = username
        self.created_at = datetime.utcnow()
