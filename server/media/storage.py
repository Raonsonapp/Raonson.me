import os
import uuid

MEDIA_ROOT = "uploads"

def save_file(file, folder="media"):
    if not os.path.exists(MEDIA_ROOT):
        os.makedirs(MEDIA_ROOT)

    ext = os.path.splitext(file.filename)[1]
    filename = f"{uuid.uuid4()}{ext}"
    path = os.path.join(MEDIA_ROOT, filename)

    with open(path, "wb") as f:
        f.write(file.file.read())

    return f"/{MEDIA_ROOT}/{filename}"
