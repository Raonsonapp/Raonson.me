import 'anime_scene.dart';

class EpisodePlan {
  final String episodeId;
  final List<AnimeScene> scenes;

  EpisodePlan({
    required this.episodeId,
    required this.scenes,
  });

  Duration get totalDuration =>
      scenes.fold(Duration.zero, (a, b) => a + b.duration);
}