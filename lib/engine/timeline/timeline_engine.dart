import 'core/scene.dart';
import 'core/timeline.dart';
import 'services/timeline_builder.dart';

class TimelineEngine {
  TimelineEngine._();
  static final TimelineEngine instance = TimelineEngine._();

  Timeline build({
    required List<Scene> scenes,
    required int totalDurationSeconds,
  }) {
    return TimelineBuilder().build(
      scenes: scenes,
      totalDurationSeconds: totalDurationSeconds,
    );
  }
}