import 'episode.dart';
import 'scene_player.dart';
import 'timeline_event.dart';

class EpisodeSequencer {
  final ScenePlayer player = ScenePlayer();
  int index = 0;

  List<TimelineEvent> update(Episode episode, Duration frame) {
    if (index >= episode.scenes.length) return [];

    final scene = episode.scenes[index];
    final events = player.update(scene, frame);

    if (player.controller.current >= scene.duration) {
      index++;
      player.reset();
    }

    return events;
  }
}