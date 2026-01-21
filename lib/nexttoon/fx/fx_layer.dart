import 'fx_clip.dart';

class FxLayer {
  final String sceneId;
  final List<FxClip> effects;

  FxLayer({
    required this.sceneId,
    required this.effects,
  });

  void addEffect(FxClip clip) {
    effects.add(clip);
  }
}