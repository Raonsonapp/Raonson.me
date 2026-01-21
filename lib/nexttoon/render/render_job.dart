import 'timeline_master.dart';

class RenderJob {
  final String jobId;
  final TimelineMaster timeline;
  final int fps;

  RenderJob({
    required this.jobId,
    required this.timeline,
    this.fps = 24,
  });

  int get totalFrames =>
      (timeline.totalDuration.inMilliseconds / (1000 / fps)).round();
}