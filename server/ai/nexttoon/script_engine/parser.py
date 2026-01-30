def parse_script(text):
    lines = text.strip().split("\n")
    scenes = []

    for line in lines:
        if ":" in line:
            character, dialogue = line.split(":", 1)
            scenes.append({
                "character": character.strip().lower(),
                "text": dialogue.strip()
            })

    return scenes


if __name__ == "__main__":
    script = """
    Hero: I will protect everyone.
    Villain: You are too weak.
    Narrator: The battle begins.
    """

    result = parse_script(script)
    for r in result:
        print(r)
