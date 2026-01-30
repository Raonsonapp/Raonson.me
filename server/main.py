# server/main.py

from fastapi import FastAPI
from config import APP_NAME, APP_VERSION

app = FastAPI(
    title=APP_NAME,
    version=APP_VERSION
)

@app.get("/")
def root():
    return {
        "status": "ok",
        "message": "Raonson server is running ✅"
    }

@app.get("/health")
def health():
    return {
        "server": "raonson",
        "alive": True
    }
