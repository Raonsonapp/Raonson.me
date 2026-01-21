class NextToonMotionEngine {
  Map<String, dynamic> generateMotion({
    required String character,
    required String emotion,
  }) {
    return {
      "character": character,
      "emotion": emotion,
      "skeleton": "anime_rig_v2",
      "fps": 24,
    };
  }
}