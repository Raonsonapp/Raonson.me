import '../models/shot_model.dart';
import 'render_job.dart';
import 'render_queue.dart';
import 'render_executor.dart';

class EpisodeRenderManager {
  late final RenderQueue queue;
  late final RenderExecutor executor;

  EpisodeRenderManager() {
    queue = RenderQueue(maxParallelJobs: 2);
    executor = RenderExecutor(queue);
  }

  void enqueueShots(List<ToonShot> shots) {
    for (final shot in shots) {
      queue.addJob(
        RenderJob(
          id: 'job-${shot.id}',
          shotId: shot.id,
          prompt: shot.prompt,
        ),
      );
    }
  }

  void startRendering() {
    executor.start();
  }

  bool get isCompleted =>
      queue.allJobs.every((j) => j.status == RenderStatus.completed);
}