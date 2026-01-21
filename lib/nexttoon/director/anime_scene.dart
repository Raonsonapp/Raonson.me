import 'scene_type.dart';

class AnimeScene {
  final String id;
  final SceneType type;
  final Duration duration;
  final String description;

  AnimeScene({
    required this.id,
    required this.type,
    required this.duration,
    required this.description,
  });
}