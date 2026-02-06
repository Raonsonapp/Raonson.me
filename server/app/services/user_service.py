from datetime import datetime

USERS = {}
FOLLOWS = set()  # (follower_id, following_id)
USER_ID = 1

def create_user(username: str):
    global USER_ID
    user = {
        "id": USER_ID,
        "username": username,
        "bio": None,
        "avatar_url": None,
        "created_at": datetime.utcnow()
    }
    USERS[USER_ID] = user
    USER_ID += 1
    return user


def get_user(user_id: int):
    return USERS.get(user_id)


def update_user(user_id: int, bio=None, avatar_url=None):
    user = USERS.get(user_id)
    if not user:
        return None

    if bio is not None:
        user["bio"] = bio
    if avatar_url is not None:
        user["avatar_url"] = avatar_url

    return user


def follow(follower_id: int, following_id: int):
    if follower_id == following_id:
        return False
    FOLLOWS.add((follower_id, following_id))
    return True


def unfollow(follower_id: int, following_id: int):
    FOLLOWS.discard((follower_id, following_id))
    return True


def followers_count(user_id: int):
    return len([1 for f in FOLLOWS if f[1] == user_id])


def following_count(user_id: int):
    return len([1 for f in FOLLOWS if f[0] == user_id])
