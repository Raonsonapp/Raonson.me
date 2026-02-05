from fastapi import FastAPI
from app.database import engine, Base

app = FastAPI(title="Raonson API", version="1.0.0")

Base.metadata.create_all(bind=engine)

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}
