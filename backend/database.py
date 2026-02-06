from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql://USER:PASSWORD@HOST:PORT/DBNAME"
)

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine, autoflush=False)
Base = declarative_base()
