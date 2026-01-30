def parse_script(text):
    scenes = []

    lines = text.strip().split("\n")
    for i, line in enumerate(lines):
        if ":" not in line:
            continue

        character, dialogue = line.split(":", 1)
        scenes.append({
            "id": i + 1,
            "character": character.strip().lower(),
            "text": dialogue.strip()
        })

    return scenes


if __name__ == "__main__":
    script = """
    Hero: I will protect everyone.
    Villain: You are too weak to stop me.
    Narrator: The final battle begins.
    """

    parsed = parse_script(script)

    for scene in parsed:
        print(scene)
