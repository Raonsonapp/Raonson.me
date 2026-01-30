# server/auth/auth_service.py

fake_users_db = {}

def register_user(email: str, password: str, username: str):
    if email in fake_users_db:
        return None

    fake_users_db[email] = {
        "email": email,
        "password": password,
        "username": username
    }
    return fake_users_db[email]


def login_user(email: str, password: str):
    user = fake_users_db.get(email)
    if not user:
        return None

    if user["password"] != password:
        return None

    return user
