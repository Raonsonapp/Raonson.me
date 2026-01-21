import 'render_config.dart';
import 'render_timeline.dart';

class VideoEncoder {
  Future<String> encode(
    RenderTimeline timeline,
    RenderConfig config,
  ) async {
    // PLACEHOLDER:
    // ffmpeg / media_codec / cloud encoder
    return "output/episode_final.mp4";
  }
}