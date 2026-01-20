/// lib/engine/video/core/video_job.dart

class VideoJob {
  final List<String> inputAssets; // images / clips
  final int targetDurationSeconds;
  final int fps;
  final VideoStyle style;

  VideoJob({
    required this.inputAssets,
    required this.targetDurationSeconds,
    this.fps = 24,
    this.style = VideoStyle.anime,
  });
}

enum VideoStyle {
  anime,
  cinematic,
  realistic,
}

class VideoJobResult {
  final String outputPath;
  final int durationSeconds;

  VideoJobResult({
    required this.outputPath,
    required this.durationSeconds,
  });
}