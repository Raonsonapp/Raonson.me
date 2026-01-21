import '../models/episode_model.dart';
import '../models/scene_model.dart';
import '../models/shot_model.dart';
import 'scene_generator.dart';
import 'shot_generator.dart';

class EpisodePipeline {
  final ToonEpisode episode;

  EpisodePipeline(this.episode);

  List<ToonScene> buildScenes() {
    return SceneGenerator.generateScenes(
      episodeId: episode.id,
      durationMinutes: episode.durationMinutes,
    );
  }

  Map<ToonScene, List<ToonShot>> buildShots(List<ToonScene> scenes) {
    final Map<ToonScene, List<ToonShot>> result = {};

    for (final scene in scenes) {
      result[scene] = ShotGenerator.generateShots(scene);
    }

    return result;
  }
}
