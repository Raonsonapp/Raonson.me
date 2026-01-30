class BaseVoice:
    def __init__(self, name, gender, language, pitch, speed, emotion):
        self.name = name
        self.gender = gender
        self.language = language
        self.pitch = pitch
        self.speed = speed
        self.emotion = emotion

    def describe(self):
        return {
            "name": self.name,
            "gender": self.gender,
            "language": self.language,
            "pitch": self.pitch,
            "speed": self.speed,
            "emotion": self.emotion
        }
