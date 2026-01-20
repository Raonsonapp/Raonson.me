class VideoScene {
  final String sceneId;
  final String backgroundAsset; // image/video
  final List<String> characterLayers; // sprites / 3D refs
  final int durationMs;

  VideoScene({
    required this.sceneId,
    required this.backgroundAsset,
    required this.characterLayers,
    required this.durationMs,
  });
}