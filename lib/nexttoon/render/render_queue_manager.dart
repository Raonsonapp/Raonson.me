import 'render_queue_state.dart';
import 'render_task.dart';
import 'render_status.dart';

class RenderQueueManager {
  final RenderQueueState state =
      RenderQueueState(queue: []);

  void addTask(RenderTask task) {
    state.queue.add(task);
  }

  RenderTask? getNext() {
    try {
      return state.queue.firstWhere(
        (t) => t.status == RenderStatus.waiting,
      );
    } catch (_) {
      return null;
    }
  }

  void markRendering(RenderTask task) {
    task.status = RenderStatus.rendering;
  }

  void markCompleted(RenderTask task) {
    task.status = RenderStatus.completed;
    task.progress = 1.0;
  }

  void markFailed(RenderTask task) {
    task.status = RenderStatus.failed;
  }
}