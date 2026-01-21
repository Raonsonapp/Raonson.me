enum RenderStatus {
  pending,
  rendering,
  completed,
  failed,
}

class RenderJob {
  final String id;
  final String shotId;
  final String prompt;

  RenderStatus status;
  double progress; // 0.0 → 1.0

  RenderJob({
    required this.id,
    required this.shotId,
    required this.prompt,
    this.status = RenderStatus.pending,
    this.progress = 0.0,
  });
}