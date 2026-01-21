class EpisodeMetadata {
  final String genre;
  final String style; // anime / 2.5D / 3D
  final int fps;
  final String resolution; // 720p / 1080p / 4K
  final String language;

  EpisodeMetadata({
    required this.genre,
    required this.style,
    required this.fps,
    required this.resolution,
    required this.language,
  });
}