enum SceneLayerType {
  background,
  character,
  effect,
  ui,
}

class SceneLayer {
  final String id;
  final SceneLayerType type;
  final int order;

  SceneLayer({
    required this.id,
    required this.type,
    required this.order,
  });
}