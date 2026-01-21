enum RenderQuality {
  low,
  medium,
  high,
  ultra,
}

class RenderConfig {
  final int width;
  final int height;
  final int fps;
  final RenderQuality quality;

  RenderConfig({
    required this.width,
    required this.height,
    required this.fps,
    required this.quality,
  });
}