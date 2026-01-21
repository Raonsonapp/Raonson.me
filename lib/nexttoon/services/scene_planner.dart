import '../models/anime_scene.dart';

class ScenePlanner {
  void enhance(List<AnimeScene> scenes) {
    for (var s in scenes) {
      s.description += ' | cinematic camera | dynamic lighting';
    }
  }
}