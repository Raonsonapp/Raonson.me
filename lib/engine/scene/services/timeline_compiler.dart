import '../core/scene.dart';
import '../core/timeline.dart';

class TimelineCompiler {
  Timeline compile(List<Scene> scenes) {
    double time = 0;
    final blocks = <TimelineBlock>[];

    for (final scene in scenes) {
      for (final shot in scene.shots) {
        final start = time;
        final end = time + shot.duration;

        blocks.add(
          TimelineBlock(
            id: shot.id,
            start: start,
            end: end,
            type: 'scene',
          ),
        );

        time = end;
      }
    }

    return Timeline(
      blocks: blocks,
      totalDuration: time,
    );
  }
}