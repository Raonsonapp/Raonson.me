import os

OUTPUT_DIR = "output_audio"
os.makedirs(OUTPUT_DIR, exist_ok=True)

def text_to_audio(text, voice="narrator"):
    filename = f"{voice}_sample.txt"
    path = os.path.join(OUTPUT_DIR, filename)

    with open(path, "w", encoding="utf-8") as f:
        f.write(f"[VOICE={voice}]\n{text}")

    print("AUDIO GENERATED:", path)
    return path


if __name__ == "__main__":
    text_to_audio("Hello from NextToon!", "hero")
