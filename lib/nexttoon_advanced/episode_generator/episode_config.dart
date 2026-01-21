enum EpisodeStyle {
  anime2D,
  anime25D,
  anime25DFX,
  anime3D,
}

class EpisodeConfig {
  final Duration duration;
  final EpisodeStyle style;
  final int fps;

  EpisodeConfig({
    required this.duration,
    required this.style,
    this.fps = 24,
  });
}
