class EpisodeConfig {
  final String title;
  final int fps;
  final int durationSeconds;
  final String style;

  EpisodeConfig({
    required this.title,
    required this.fps,
    required this.durationSeconds,
    required this.style,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "fps": fps,
      "duration": durationSeconds,
      "style": style,
    };
  }
}