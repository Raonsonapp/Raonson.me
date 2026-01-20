import '../core/video_scene.dart';
import '../core/timeline.dart';

class CompositionService {
  Timeline buildTimeline(List<VideoScene> scenes) {
    int cursor = 0;
    final items = <TimelineItem>[];

    for (final s in scenes) {
      items.add(
        TimelineItem(
          refId: s.sceneId,
          startMs: cursor,
          endMs: cursor + s.durationMs,
        ),
      );
      cursor += s.durationMs;
    }

    return Timeline(items: items);
  }
}