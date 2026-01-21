class SceneTimelineEvent {
  final String targetId;
  final Duration time;
  final String action;

  SceneTimelineEvent({
    required this.targetId,
    required this.time,
    required this.action,
  });
}

class SceneTimeline {
  final List<SceneTimelineEvent> events;

  SceneTimeline(this.events);
}