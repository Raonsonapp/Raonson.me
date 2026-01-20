class EpisodeScene {
  final int index;
  final String description;
  final int startFrame;
  final int endFrame;

  EpisodeScene({
    required this.index,
    required this.description,
    required this.startFrame,
    required this.endFrame,
  });

  Map<String, dynamic> toMap() {
    return {
      "index": index,
      "description": description,
      "start": startFrame,
      "end": endFrame,
    };
  }
}