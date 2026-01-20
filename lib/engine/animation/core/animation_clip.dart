import 'animation_layer.dart';
import 'animation_timeline.dart';

class AnimationClip {
  final String clipId;
  final List<AnimationLayer> layers;
  final AnimationTimeline timeline;

  AnimationClip({
    required this.clipId,
    required this.layers,
    required this.timeline,
  });
}
