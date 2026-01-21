import 'render_job.dart';
import 'render_job_status.dart';

class RenderJobQueue {
  final List<RenderJob> _queue = [];

  List<RenderJob> get jobs => List.unmodifiable(_queue);

  void add(RenderJob job) {
    _queue.add(job);
  }

  RenderJob? getNext() {
    try {
      return _queue.firstWhere(
        (j) => j.status == RenderJobStatus.pending,
      );
    } catch (_) {
      return null;
    }
  }

  void updateProgress(String jobId, double value) {
    final job = _queue.firstWhere((j) => j.id == jobId);
    job.progress = value;
  }

  void markRendering(String jobId) {
    final job = _queue.firstWhere((j) => j.id == jobId);
    job.status = RenderJobStatus.rendering;
  }

  void markCompleted(String jobId) {
    final job = _queue.firstWhere((j) => j.id == jobId);
    job.status = RenderJobStatus.completed;
    job.progress = 1.0;
  }

  void markFailed(String jobId, String error) {
    final job = _queue.firstWhere((j) => j.id == jobId);
    job.status = RenderJobStatus.failed;
    job.error = error;
  }
}