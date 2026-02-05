from fastapi import FastAPI

app = FastAPI(title="Raonson API", version="1.0.0")

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}
