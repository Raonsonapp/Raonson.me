from fastapi import FastAPI

app = FastAPI(title="Raonson Server")

@app.get("/")
def root():
    return {
        "status": "Raonson server is running 🚀"
    }

@app.get("/health")
def health():
    return {"ok": True}
