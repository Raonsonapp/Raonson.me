enum Emotion {
  neutral,
  happy,
  angry,
  sad,
  epic,
}

class VoiceLine {
  final String characterId;
  final String text;
  final Emotion emotion;
  final int estimatedDurationMs;

  VoiceLine({
    required this.characterId,
    required this.text,
    this.emotion = Emotion.neutral,
    required this.estimatedDurationMs,
  });
}