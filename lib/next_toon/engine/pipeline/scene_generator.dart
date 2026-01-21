import '../models/scene_model.dart';

class SceneGenerator {
  /// Генератсия мекунад саҳнаҳоро барои 1 эпизод (8–10 дақиқа)
  static List<ToonScene> generateScenes({
    required String episodeId,
    required int durationMinutes,
  }) {
    final totalSeconds = durationMinutes * 60;

    // миёна 40–60 сония барои 1 саҳна
    final sceneDuration = 50;
    final sceneCount = (totalSeconds / sceneDuration).floor();

    return List.generate(sceneCount, (index) {
      return ToonScene(
        id: '$episodeId-scene-$index',
        description: 'Anime cinematic scene ${index + 1}',
        durationSeconds: sceneDuration,
      );
    });
  }
}