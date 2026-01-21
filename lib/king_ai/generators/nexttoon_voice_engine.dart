class NextToonVoiceEngine {
  Map<String, dynamic> generateVoice({
    required String text,
    required String language,
    required String emotion,
  }) {
    return {
      "engine": "studio_voice",
      "language": language,
      "emotion": emotion,
      "text": text,
    };
  }
}