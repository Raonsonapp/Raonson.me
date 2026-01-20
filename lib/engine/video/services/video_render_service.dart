import '../core/video_scene.dart';
import '../core/timeline.dart';
import '../video_engine.dart';

class VideoRenderer {
  Future<VideoResult> render({
    required List<VideoScene> scenes,
    required Timeline timeline,
    required String outputFormat,
  }) async {
    // Placeholder: real render via FFmpeg / AI video later
    final output = "nexttoon_render_${DateTime.now().millisecondsSinceEpoch}.$outputFormat";

    return VideoResult(
      filePath: output,
      durationMs: timeline.totalDurationMs,
    );
  }
}