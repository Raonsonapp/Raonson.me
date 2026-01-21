import 'render_config.dart';
import 'render_timeline.dart';
import 'video_encoder.dart';

class FinalRenderer {
  final VideoEncoder encoder = VideoEncoder();

  Future<String> render(RenderTimeline timeline) async {
    final config = RenderConfig(
      width: 1920,
      height: 1080,
      fps: 24,
      quality: RenderQuality.high,
    );

    return await encoder.encode(timeline, config);
  }
}
