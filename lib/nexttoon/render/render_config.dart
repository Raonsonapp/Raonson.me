class RenderConfig {
  final int fps;
  final int width;
  final int height;

  const RenderConfig({
    required this.fps,
    required this.width,
    required this.height,
  });

  static const anime1080p =
      RenderConfig(fps: 24, width: 1920, height: 1080);
}