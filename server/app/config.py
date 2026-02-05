from dotenv import load_dotenv
import os

load_dotenv()

class Settings:
    PROJECT_NAME = "Raonson"
    SECRET_KEY = os.getenv("SECRET_KEY", "raonson_secret")
    ALGORITHM = "HS256"
    DATABASE_URL = os.getenv(
        "DATABASE_URL",
        "postgresql://postgres:password@localhost:5432/raonson"
    )

settings = Settings()
