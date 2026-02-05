from fastapi import FastAPI
from database import Base, engine
from auth import router as auth_router

app = FastAPI(title="Raonson API")

Base.metadata.create_all(bind=engine)

app.include_router(auth_router)

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}
