import '../animation/animation_frame.dart';

class TimelineClip {
  final String id;
  final Duration start;
  final Duration duration;
  final List<AnimationFrame> frames;

  TimelineClip({
    required this.id,
    required this.start,
    required this.duration,
    required this.frames,
  });

  Duration get end => start + duration;
}