from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"status": "Raonson server is running"}
