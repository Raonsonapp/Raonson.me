import 'render_status.dart';

class RenderTask {
  final String id;
  final Duration duration;
  RenderStatus status;
  double progress; // 0.0 - 1.0

  RenderTask({
    required this.id,
    required this.duration,
    this.status = RenderStatus.waiting,
    this.progress = 0.0,
  });
}