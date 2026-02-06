from fastapi import FastAPI
from database import Base, engine
from routers.auth import router as auth_router
from routers.posts import router as posts_router

app = FastAPI(title="Raonson v2 Backend")

Base.metadata.create_all(bind=engine)

app.include_router(auth_router)

@app.get("/")
def root():
    return {"status": "Raonson v2 backend running"}
app.include_router(posts_router)
