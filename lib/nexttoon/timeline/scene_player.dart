import 'scene.dart';
import 'timeline_controller.dart';
import 'timeline_event.dart';

class ScenePlayer {
  final TimelineController controller = TimelineController();

  List<TimelineEvent> update(Scene scene, Duration frameTime) {
    return controller.tick(scene, frameTime);
  }

  void reset() => controller.reset();
}