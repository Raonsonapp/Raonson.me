import '../models/scene_model.dart';
import '../models/shot_model.dart';

class ShotGenerator {
  /// Ҳар саҳнаро ба чанд shot мешиканад
  static List<ToonShot> generateShots(ToonScene scene) {
    final shotCount = (scene.durationSeconds / 5).ceil();

    return List.generate(shotCount, (index) {
      return ToonShot(
        id: '${scene.id}-shot-$index',
        type: ShotType.action,
        durationSeconds: 5,
        prompt:
            'High quality anime shot, ${scene.description}, dynamic action, cinematic lighting',
      );
    });
  }
}