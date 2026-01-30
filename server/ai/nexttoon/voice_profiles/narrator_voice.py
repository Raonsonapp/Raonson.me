from .base_voice import BaseVoice

NarratorVoice = BaseVoice(
    name="Narrator",
    gender="neutral",
    language="fa-tj",
    pitch=1.0,
    speed=0.95,
    emotion="calm"
)
