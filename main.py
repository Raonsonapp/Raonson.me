from fastapi import FastAPI

# =====================
# ROUTES IMPORT
# =====================

from app.routes.auth import router as auth_router
from app.routes.posts import router as posts_router
from app.routes.comments import router as comments_router
from app.routes.users import router as users_router
from app.routes.reels import router as reels_router
from app.routes.stories import router as stories_router
from app.routes.search import router as search_router
from app.routes.chats import router as chats_router

# =====================
# APP INIT
# =====================

app = FastAPI(
    title="Raonson API",
    description="Instagram-like backend server",
    version="1.0.0"
)

# =====================
# CORE ROUTES
# =====================

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}

# =====================
# INCLUDE ROUTERS
# =====================

app.include_router(auth_router)
app.include_router(users_router)
app.include_router(posts_router)
app.include_router(comments_router)
app.include_router(reels_router)
app.include_router(stories_router)
app.include_router(search_router)
app.include_router(chats_router)
