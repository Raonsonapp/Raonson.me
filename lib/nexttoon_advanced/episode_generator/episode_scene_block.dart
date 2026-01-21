import '../scene_composer/scene_composer.dart';

class EpisodeSceneBlock {
  final String id;
  final SceneComposer scene;
  final Duration startAt;
  final Duration length;

  EpisodeSceneBlock({
    required this.id,
    required this.scene,
    required this.startAt,
    required this.length,
  });
}