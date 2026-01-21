import 'video_quality.dart';

class DownloadTask {
  final String videoId;
  final VideoQuality quality;
  double progress;

  DownloadTask({
    required this.videoId,
    required this.quality,
    this.progress = 0,
  });
}
