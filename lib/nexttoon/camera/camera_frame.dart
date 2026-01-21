class CameraFrame {
  final Duration start;
  final Duration duration;
  final double intensity; // 0.0 – 1.0

  CameraFrame({
    required this.start,
    required this.duration,
    required this.intensity,
  });
}