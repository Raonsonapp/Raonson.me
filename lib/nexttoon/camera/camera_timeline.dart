import 'camera_event.dart';

class CameraTimeline {
  final List<CameraEvent> events = [];

  void add(CameraEvent event) {
    events.add(event);
  }
}