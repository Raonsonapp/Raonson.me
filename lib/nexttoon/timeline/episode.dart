import 'scene.dart';

class Episode {
  final String id;
  final List<Scene> scenes;

  Episode({
    required this.id,
    required this.scenes,
  });

  Duration get totalDuration {
    return scenes.fold(
      Duration.zero,
      (sum, s) => sum + s.duration,
    );
  }
}
