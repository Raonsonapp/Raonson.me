fake_users = []

def register_user(data):
    fake_users.append(data)
    return {"message": "User registered successfully"}

def login_user(data):
    for user in fake_users:
        if user["email"] == data["email"] and user["password"] == data["password"]:
            return {"message": "Login successful"}
    return {"error": "Invalid credentials"}
