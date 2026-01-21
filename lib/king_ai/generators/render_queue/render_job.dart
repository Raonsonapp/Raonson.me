import 'render_job_status.dart';

class RenderJob {
  final String id;
  final Map<String, dynamic> payload;
  RenderJobStatus status;
  double progress; // 0.0 → 1.0
  String? error;

  RenderJob({
    required this.id,
    required this.payload,
    this.status = RenderJobStatus.pending,
    this.progress = 0.0,
    this.error,
  });
}
