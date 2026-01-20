import '../core/scene.dart';
import '../core/timeline.dart';

class TimelineBuilder {
  Timeline build({
    required List<Scene> scenes,
    required int totalDurationSeconds,
  }) {
    int used = 0;
    List<Scene> finalScenes = [];

    for (final scene in scenes) {
      if (used + scene.durationSeconds > totalDurationSeconds) {
        break;
      }
      finalScenes.add(scene);
      used += scene.durationSeconds;
    }

    return Timeline(
      scenes: finalScenes,
      totalDurationSeconds: used,
    );
  }
}
