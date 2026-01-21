class DubbingTask {
  final String videoId;
  final String sourceLang;
  final String targetLang;
  double progress;

  DubbingTask({
    required this.videoId,
    required this.sourceLang,
    required this.targetLang,
    this.progress = 0,
  });
}