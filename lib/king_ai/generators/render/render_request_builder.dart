import 'render_request.dart';
import 'render_engine_target.dart';
import 'render_quality.dart';
import 'render_style.dart';

class RenderRequestBuilder {
  Map<String, dynamic> create({
    required Map<String, dynamic> episodePayload,
  }) {
    final quality = RenderQuality(
      width: 1920,
      height: 1080,
      bitrate: 12000,
      fps: 24,
    );

    final style = RenderStyle(
      name: "Anime Cinematic",
      cinematic: true,
      animeLines: true,
      particles: true,
    );

    final request = RenderRequest(
      episodePayload: episodePayload,
      engine: RenderEngineTarget.animeStudio,
      quality: quality,
      style: style,
    );

    return request.build();
  }
}