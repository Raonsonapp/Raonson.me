import 'episode_structure.dart';
import 'composed_scene.dart';

class EpisodeBuilder {
  EpisodeStructure build(String id, List<ComposedScene> scenes) {
    return EpisodeStructure(
      episodeId: id,
      scenes: scenes,
    );
  }
}