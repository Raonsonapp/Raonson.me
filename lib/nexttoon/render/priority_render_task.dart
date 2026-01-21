import 'render_task.dart';
import 'render_priority.dart';

class PriorityRenderTask extends RenderTask {
  final RenderPriority priority;

  PriorityRenderTask({
    required super.id,
    required super.duration,
    this.priority = RenderPriority.normal,
  });
}