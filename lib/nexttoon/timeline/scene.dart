import 'timeline_event.dart';

class Scene {
  final String id;
  final Duration duration;
  final List<TimelineEvent> events;

  Scene({
    required this.id,
    required this.duration,
    required this.events,
  });
}