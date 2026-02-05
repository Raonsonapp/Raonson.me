from fastapi import FastAPI
from app.config import settings

app = FastAPI(title=settings.PROJECT_NAME)

@app.get("/")
def root():
    return {
        "status": "Raonson server is running 🚀"
    }
