import 'composed_scene.dart';

class EpisodeStructure {
  final String episodeId;
  final List<ComposedScene> scenes;

  EpisodeStructure({
    required this.episodeId,
    required this.scenes,
  });

  Duration get duration =>
      scenes.isEmpty ? Duration.zero : scenes.last.end;
}