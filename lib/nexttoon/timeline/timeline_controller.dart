import 'scene.dart';
import 'timeline_event.dart';

class TimelineController {
  Duration current = Duration.zero;
  int sceneIndex = 0;

  List<TimelineEvent> tick(Scene scene, Duration delta) {
    current += delta;

    return scene.events
        .where((e) =>
            e.at <= current &&
            e.at > current - delta)
        .toList();
  }

  void reset() {
    current = Duration.zero;
    sceneIndex = 0;
  }
}