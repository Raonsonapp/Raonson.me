import 'scene.dart';
import 'timeline_event.dart';
import 'timeline_event_type.dart';

Scene battleScene() {
  return Scene(
    id: 'battle_01',
    duration: const Duration(seconds: 40),
    events: [
      TimelineEvent(
        type: TimelineEventType.sceneStart,
        at: Duration.zero,
        payload: {},
      ),
      TimelineEvent(
        type: TimelineEventType.cameraMove,
        at: const Duration(seconds: 2),
        payload: {'preset': 'dramaticZoom'},
      ),
      TimelineEvent(
        type: TimelineEventType.effect,
        at: const Duration(seconds: 10),
        payload: {'effect': 'slash_fx'},
      ),
      TimelineEvent(
        type: TimelineEventType.sceneEnd,
        at: const Duration(seconds: 40),
        payload: {},
      ),
    ],
  );
}