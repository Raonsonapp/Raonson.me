class FxFrame {
  final Duration start;
  final Duration duration;
  final double intensity; // 0.0 - 1.0

  FxFrame({
    required this.start,
    required this.duration,
    required this.intensity,
  });
}