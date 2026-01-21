import 'render_job.dart';

class RenderQueue {
  final List<RenderJob> _queue = [];
  final int maxParallelJobs;

  RenderQueue({this.maxParallelJobs = 3});

  List<RenderJob> get allJobs => _queue;

  void addJob(RenderJob job) {
    _queue.add(job);
  }

  List<RenderJob> get pendingJobs =>
      _queue.where((j) => j.status == RenderStatus.pending).toList();

  List<RenderJob> get activeJobs =>
      _queue.where((j) => j.status == RenderStatus.rendering).toList();

  bool get canStartMore =>
      activeJobs.length < maxParallelJobs && pendingJobs.isNotEmpty;
}