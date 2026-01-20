enum EmotionType {
  calm,
  angry,
  sad,
  happy,
  epic,
}

class EmotionProfile {
  final EmotionType type;
  final double intensity; // 0.0 - 1.0

  EmotionProfile({
    required this.type,
    required this.intensity,
  });
}