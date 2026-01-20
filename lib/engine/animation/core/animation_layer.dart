enum AnimationLayerType {
  background,
  character,
  effect,
  camera,
}

class AnimationLayer {
  final String id;
  final AnimationLayerType type;
  final String asset;
  final double opacity;

  AnimationLayer({
    required this.id,
    required this.type,
    required this.asset,
    this.opacity = 1.0,
  });
}