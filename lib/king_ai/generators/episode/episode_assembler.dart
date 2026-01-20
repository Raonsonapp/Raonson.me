import 'episode_config.dart';
import 'episode_timeline.dart';
import 'episode_audio_bind.dart';

class EpisodeAssembler {
  Map<String, dynamic> assemble({
    required EpisodeConfig config,
    required EpisodeTimeline timeline,
    required Map audio,
  }) {
    return {
      "config": config.toMap(),
      "timeline": timeline.build(),
      "audio": audio,
      "status": "ready_for_render",
    };
  }
}
