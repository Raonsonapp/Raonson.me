import 'episode_timeline.dart';
import 'episode_config.dart';

class EpisodeRenderer {
  final EpisodeTimeline timeline;
  final EpisodeConfig config;

  EpisodeRenderer({
    required this.timeline,
    required this.config,
  });

  bool canRender() {
    return timeline.totalDuration >= config.duration;
  }

  Future<void> render() async {
    if (!canRender()) {
      throw Exception('Episode duration is too short');
    }

    // PLACEHOLDER:
    // Later: GPU render, frame stitching, FX pipeline
    await Future.delayed(const Duration(seconds: 2));
  }
}