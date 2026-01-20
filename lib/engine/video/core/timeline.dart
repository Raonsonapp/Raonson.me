import 'scene.dart';

class Timeline {
  final List<Scene> scenes;

  Timeline(this.scenes);

  double get totalDuration =>
      scenes.fold(0, (sum, s) => sum + s.duration);
}