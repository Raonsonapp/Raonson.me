from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"status": "Raonson server is running"}

@app.get("/health")
def health():
    return {"health": "ok"}
