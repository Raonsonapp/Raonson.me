import 'episode_config.dart';
import 'episode_scene_block.dart';
import 'episode_timeline.dart';
import 'episode_renderer.dart';

class EpisodeGenerator {
  final EpisodeConfig config;
  final EpisodeTimeline timeline = EpisodeTimeline();

  EpisodeGenerator(this.config);

  void addScene(EpisodeSceneBlock block) {
    timeline.addBlock(block);
  }

  Future<void> generate() async {
    final renderer = EpisodeRenderer(
      timeline: timeline,
      config: config,
    );

    await renderer.render();
  }
}