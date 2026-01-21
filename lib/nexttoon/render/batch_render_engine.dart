import 'dart:async';
import 'render_queue_manager.dart';
import 'render_task.dart';

class BatchRenderEngine {
  final RenderQueueManager manager;

  BatchRenderEngine(this.manager);

  Future<void> processNext() async {
    final task = manager.getNext();
    if (task == null) return;

    manager.markRendering(task);

    // simulate render progress
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      task.progress = i / 10;
    }

    manager.markCompleted(task);
  }
}