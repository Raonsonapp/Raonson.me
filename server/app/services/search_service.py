from app.services.post_service import POSTS
from app.services.user_service import USERS
from app.services.reel_service import REELS

def search_all(query: str):
    q = query.lower()

    posts = [p for p in POSTS if q in p["caption"].lower()]
    users = [u for u in USERS.values() if q in u["username"].lower()]
    reels = [r for r in REELS if q in (r["caption"] or "").lower()]

    return {
        "users": users,
        "posts": posts,
        "reels": reels
    }
