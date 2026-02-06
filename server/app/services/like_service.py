LIKES = {}  # post_id -> count

def like_post(post_id: int):
    if post_id not in LIKES:
        LIKES[post_id] = 0

    LIKES[post_id] += 1
    return LIKES[post_id]


def get_likes(post_id: int):
    return LIKES.get(post_id, 0)
