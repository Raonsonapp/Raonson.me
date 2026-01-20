import 'episode_scene.dart';

class EpisodeTimeline {
  final List<EpisodeScene> scenes;

  EpisodeTimeline(this.scenes);

  Map<String, dynamic> build() {
    return {
      "total_scenes": scenes.length,
      "scenes": scenes.map((e) => e.toMap()).toList(),
    };
  }
}