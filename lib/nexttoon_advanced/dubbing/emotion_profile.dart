enum EmotionProfile {
  neutral,
  happy,
  angry,
  sad,
  epic,
  dark,
}

extension EmotionProfileExt on EmotionProfile {
  double get pitch {
    switch (this) {
      case EmotionProfile.happy:
        return 1.1;
      case EmotionProfile.angry:
        return 1.2;
      case EmotionProfile.sad:
        return 0.9;
      case EmotionProfile.epic:
        return 1.15;
      case EmotionProfile.dark:
        return 0.85;
      default:
        return 1.0;
    }
  }

  double get speed {
    switch (this) {
      case EmotionProfile.angry:
        return 1.1;
      case EmotionProfile.sad:
        return 0.9;
      default:
        return 1.0;
    }
  }
}