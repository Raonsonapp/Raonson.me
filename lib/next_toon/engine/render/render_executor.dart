import 'dart:async';
import 'render_job.dart';
import 'render_queue.dart';

class RenderExecutor {
  final RenderQueue queue;

  RenderExecutor(this.queue);

  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!queue.canStartMore) return;

      final job = queue.pendingJobs.first;
      _runJob(job);
    });
  }

  void _runJob(RenderJob job) {
    job.status = RenderStatus.rendering;

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      job.progress += 0.1;

      if (job.progress >= 1.0) {
        job.progress = 1.0;
        job.status = RenderStatus.completed;
        timer.cancel();
      }
    });
  }
}