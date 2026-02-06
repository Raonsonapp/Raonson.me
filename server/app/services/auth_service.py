# Business logic for authentication

FAKE_USERS = []
USER_ID = 1

def register_user(username: str, password: str):
    global USER_ID

    for user in FAKE_USERS:
        if user["username"] == username:
            return None  # already exists

    user = {
        "id": USER_ID,
        "username": username,
        "password": password
    }

    FAKE_USERS.append(user)
    USER_ID += 1
    return user


def login_user(username: str, password: str):
    for user in FAKE_USERS:
        if user["username"] == username and user["password"] == password:
            return user

    return None
