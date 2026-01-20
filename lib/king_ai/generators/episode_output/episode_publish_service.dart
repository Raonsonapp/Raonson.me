import 'episode_asset.dart';
import 'episode_library.dart';

class EpisodePublishService {
  final EpisodeLibrary library;

  EpisodePublishService(this.library);

  void publish(EpisodeAsset episode) {
    library.add(episode);
  }
}