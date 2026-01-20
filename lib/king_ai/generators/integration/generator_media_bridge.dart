class GeneratorMediaBridge {
  void registerEpisode(Map<String, dynamic> output) {
    // Дар оянда:
    // - Сабт ба media database
    // - Thumbnail
    // - Duration / quality
    final path = output['output']?['path'];
    if (path != null) {
      print('Episode registered: $path');
    }
  }
}