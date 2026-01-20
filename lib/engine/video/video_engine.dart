import 'core/video_scene.dart';
import 'core/timeline.dart';
import 'services/video_renderer.dart';

class VideoEngine {
  VideoEngine._();
  static final VideoEngine instance = VideoEngine._();

  Future<VideoResult> render({
    required List<VideoScene> scenes,
    required Timeline timeline,
    required String outputFormat, // mp4, webm
  }) async {
    return VideoRenderer().render(
      scenes: scenes,
      timeline: timeline,
      outputFormat: outputFormat,
    );
  }
}

class VideoResult {
  final String filePath;
  final int durationMs;

  VideoResult({required this.filePath, required this.durationMs});
}