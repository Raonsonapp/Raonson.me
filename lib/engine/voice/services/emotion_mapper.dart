import '../core/emotion_profile.dart';

class EmotionMapper {
  Map<String, double> mapEmotion(EmotionProfile emotion) {
    switch (emotion.type) {
      case EmotionType.angry:
        return {'energy': 0.9, 'tone': 0.8};
      case EmotionType.epic:
        return {'energy': 1.0, 'tone': 1.0};
      default:
        return {'energy': 0.5, 'tone': 0.5};
    }
  }
}