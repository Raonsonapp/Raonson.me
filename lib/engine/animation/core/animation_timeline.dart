class AnimationFrame {
  final int timeMs;
  final Map<String, dynamic> transform; // x, y, scale, rotate

  AnimationFrame({
    required this.timeMs,
    required this.transform,
  });
}

class AnimationTimeline {
  final List<AnimationFrame> frames;

  AnimationTimeline({required this.frames});
}