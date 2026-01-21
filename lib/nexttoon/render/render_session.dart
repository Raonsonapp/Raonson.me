import 'render_task.dart';

class RenderSession {
  final String episodeId;
  final List<RenderTask> tasks;

  RenderSession({
    required this.episodeId,
    required this.tasks,
  });
}