import 'scene.dart';

class Timeline {
  final List<Scene> scenes;
  final int totalDurationSeconds;

  Timeline({
    required this.scenes,
    required this.totalDurationSeconds,
  });
}