from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict

app = FastAPI()

users: Dict[str, str] = {}

class Auth(BaseModel):
    username: str
    password: str

@app.post("/auth/register")
def register(data: Auth):
    # агар ҳаст → OK
    users[data.username] = data.password
    return {
        "ok": True,
        "username": data.username
    }

@app.post("/auth/login")
def login(data: Auth):
    # агар user нест → месозем
    if data.username not in users:
        users[data.username] = data.password

    # агар password фарқ кунад → error
    if users[data.username] != data.password:
        raise HTTPException(status_code=401, detail="Invalid password")

    return {
        "ok": True,
        "token": data.username
    }
