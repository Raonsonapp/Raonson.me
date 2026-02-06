from datetime import datetime

COMMENTS = []
COMMENT_ID = 1

def add_comment(post_id: int, user_id: int, text: str):
    global COMMENT_ID

    comment = {
        "id": COMMENT_ID,
        "post_id": post_id,
        "user_id": user_id,
        "text": text,
        "created_at": datetime.utcnow()
    }

    COMMENTS.append(comment)
    COMMENT_ID += 1
    return comment


def list_comments(post_id: int):
    return [c for c in COMMENTS if c["post_id"] == post_id]
