import 'episode_asset.dart';

class EpisodeLibrary {
  final List<EpisodeAsset> _episodes = [];

  List<EpisodeAsset> get all => List.unmodifiable(_episodes);

  void add(EpisodeAsset episode) {
    _episodes.add(episode);
  }

  EpisodeAsset? findById(String id) {
    try {
      return _episodes.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}