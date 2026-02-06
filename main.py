from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from database import Base, engine

from routes.auth import router as auth_router
from routes.posts import router as posts_router
from routes.reels import router as reels_router
from routes.users import router as users_router
from routes.search import router as search_router
from routes.chats import router as chats_router

# ---------------- APP ----------------

app = FastAPI(
    title="Raonson Server",
    description="Raonson v1 Backend (Instagram-style MVP)",
    version="1.0.0",
)

# ---------------- CORS ----------------
# Барои Flutter / Web / APK ҳатмӣ

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # барои v1 OK, баъд маҳдуд мекунем
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ---------------- DATABASE ----------------

Base.metadata.create_all(bind=engine)

# ---------------- ROUTES ----------------

app.include_router(auth_router)
app.include_router(posts_router)
app.include_router(reels_router)
app.include_router(users_router)
app.include_router(search_router)
app.include_router(chats_router)

# ---------------- ROOT ----------------

@app.get("/")
def root():
    return {
        "status": "Raonson Server v1 running",
        "endpoints": [
            "/auth/register",
            "/auth/login",
            "/posts",
            "/reels",
            "/search?q=",
            "/users/{id}",
            "/chats/{id}",
        ],
    }

# ---------------- HEALTH ----------------

@app.get("/health")
def health():
    return {"health": "ok"}
