from database import SessionLocal
from models import User, Post, Reel, Chat

db = SessionLocal()

u1 = User(username="alex", password="123", bio="Hello")
u2 = User(username="lina", password="123", bio="Hi")

db.add_all([u1, u2])
db.commit()

db.add(Post(user_id=1, image="https://picsum.photos/400", caption="First post"))
db.add(Reel(user_id=1, video="https://example.com/video.mp4", caption="Reel 1"))
db.add(Chat(from_user=1, to_user=2, message="Hi Lina"))

db.commit()
