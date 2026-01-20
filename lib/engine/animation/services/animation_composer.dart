import '../core/animation_clip.dart';
import '../core/animation_layer.dart';
import '../core/animation_timeline.dart';

class AnimationComposer {
  AnimationClip composeBasic({
    required String clipId,
    required String characterAsset,
  }) {
    final layers = [
      AnimationLayer(
        id: 'char_1',
        type: AnimationLayerType.character,
        asset: characterAsset,
      ),
    ];

    final timeline = AnimationTimeline(frames: [
      AnimationFrame(timeMs: 0, transform: {'x': 0, 'y': 0}),
      AnimationFrame(timeMs: 500, transform: {'x': 20, 'y': 0}),
    ]);

    return AnimationClip(
      clipId: clipId,
      layers: layers,
      timeline: timeline,
    );
  }
}