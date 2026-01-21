import 'timeline_clip.dart';

class SceneTimeline {
  final String sceneId;
  final List<TimelineClip> clips;

  SceneTimeline({
    required this.sceneId,
    required this.clips,
  });

  Duration get totalDuration {
    if (clips.isEmpty) return Duration.zero;
    return clips.last.end;
  }

  void addClip(TimelineClip clip) {
    clips.add(clip);
  }
}