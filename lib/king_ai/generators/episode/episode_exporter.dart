import '../generation_result.dart';

class EpisodeExporter {
  GeneratedFile export(Map<String, dynamic> episodePayload) {
    return GeneratedFile(
      path: "nexttoon/episode/episode_payload.json",
      content: episodePayload.toString(),
    );
  }
}