class Scene {
  final String id;
  final String prompt; // anime description
  final int durationSeconds;
  final SceneType type;

  Scene({
    required this.id,
    required this.prompt,
    required this.durationSeconds,
    this.type = SceneType.anime,
  });
}

enum SceneType {
  anime,
  transition,
  dialog,
  action,
}
