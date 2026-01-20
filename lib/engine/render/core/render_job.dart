import 'video_format.dart';

class RenderJob {
  final int totalFrames;
  final int fps;
  final VideoFormat format;

  RenderJob({
    required this.totalFrames,
    required this.fps,
    required this.format,
  });
}
