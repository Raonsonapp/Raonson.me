import 'render_job_queue.dart';
import 'render_job_status.dart';

class RenderJobRunner {
  final RenderJobQueue queue;

  RenderJobRunner(this.queue);

  void process() {
    final job = queue.getNext();
    if (job == null) return;

    queue.markRendering(job.id);

    // Симуляция (offline render)
    for (int i = 1; i <= 10; i++) {
      queue.updateProgress(job.id, i / 10);
    }

    queue.markCompleted(job.id);
  }
}