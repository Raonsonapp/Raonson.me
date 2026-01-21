import '../generation_result.dart';
import 'episode_asset.dart';

class EpisodeOutputExport {
  GeneratedFile export(EpisodeAsset episode) {
    return GeneratedFile(
      path: "nexttoon/episodes/${episode.id}.json",
      content: {
        "id": episode.id,
        "title": episode.title,
        "duration": episode.duration.inSeconds,
        "video": episode.videoPath,
        "thumbnail": episode.thumbnailPath,
        "createdAt": episode.createdAt.toIso8601String(),
      }.toString(),
    );
  }
}