class VoiceProfile {
  final String language;
  final String gender;
  final String emotion;
  final double pitch;
  final double speed;

  VoiceProfile({
    required this.language,
    required this.gender,
    required this.emotion,
    required this.pitch,
    required this.speed,
  });

  Map<String, dynamic> toMap() {
    return {
      "language": language,
      "gender": gender,
      "emotion": emotion,
      "pitch": pitch,
      "speed": speed,
    };
  }
}