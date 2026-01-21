class EpisodeAsset {
  final String id;
  final String title;
  final Duration duration;
  final String videoPath;
  final String thumbnailPath;
  final DateTime createdAt;

  EpisodeAsset({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoPath,
    required this.thumbnailPath,
    required this.createdAt,
  });
}