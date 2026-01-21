import '../episode/episode_assembler.dart';
import 'render_engine_target.dart';
import 'render_quality.dart';
import 'render_style.dart';

class RenderRequest {
  final Map<String, dynamic> episodePayload;
  final RenderEngineTarget engine;
  final RenderQuality quality;
  final RenderStyle style;

  RenderRequest({
    required this.episodePayload,
    required this.engine,
    required this.quality,
    required this.style,
  });

  Map<String, dynamic> build() {
    return {
      "engine": engine.name,
      "quality": quality.toMap(),
      "style": style.toMap(),
      "episode": episodePayload,
      "render_mode": "full_episode",
    };
  }
}