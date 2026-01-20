import 'episode_asset.dart';
import 'episode_metadata.dart';

class EpisodeBuilder {
  EpisodeAsset build({
    required String title,
    required Duration duration,
    required EpisodeMetadata meta,
  }) {
    final id = "ep_${DateTime.now().millisecondsSinceEpoch}";

    return EpisodeAsset(
      id: id,
      title: title,
      duration: duration,
      videoPath: "storage/nexttoon/$id.mp4",
      thumbnailPath: "storage/nexttoon/$id.jpg",
      createdAt: DateTime.now(),
    );
  }
}