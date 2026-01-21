import 'scene_timeline.dart';

class EpisodeTimeline {
  final String episodeId;
  final List<SceneTimeline> scenes;

  EpisodeTimeline({
    required this.episodeId,
    required this.scenes,
  });

  Duration get totalDuration {
    return scenes.fold(
      Duration.zero,
      (sum, scene) => sum + scene.totalDuration,
    );
  }

  bool get isValidLength {
    final seconds = totalDuration.inSeconds;
    return seconds >= 480 && seconds <= 600; // 8–10 дақиқа
  }
}