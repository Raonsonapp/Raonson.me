import 'anime_scene.dart';
import 'scene_type.dart';
import 'episode_plan.dart';
import 'style_preset.dart';

class AIDirector {
  EpisodePlan buildEpisode({
    required String episodeId,
    required StylePreset preset,
    required Duration targetDuration,
  }) {
    final scenes = <AnimeScene>[];
    Duration current = Duration.zero;
    int index = 0;

    while (current < targetDuration) {
      final type = _pickSceneType(index);
      final duration = Duration(seconds: 20 + (index % 3) * 10);

      scenes.add(
        AnimeScene(
          id: 'scene_$index',
          type: type,
          duration: duration,
          description: 'Auto-generated $type scene',
        ),
      );

      current += duration;
      index++;
    }

    return EpisodePlan(
      episodeId: episodeId,
      scenes: scenes,
    );
  }

  SceneType _pickSceneType(int index) {
    if (index % 5 == 0) return SceneType.cinematic;
    if (index % 3 == 0) return SceneType.battle;
    if (index % 2 == 0) return SceneType.action;
    return SceneType.dialogue;
  }
}
