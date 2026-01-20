import '../scene/core/timeline.dart';
import '../voice/voice_engine.dart';
import '../style/style_engine.dart';
import 'core/render_job.dart';
import 'services/render_planner.dart';
import 'services/export_engine.dart';
import 'core/render_result.dart';

class VideoRenderEngine {
  VideoRenderEngine._();
  static final instance = VideoRenderEngine._();

  Future<RenderResult> render({
    required Timeline timeline,
    required VoiceResult voice,
    required StyleResult style,
  }) async {
    final job = RenderPlanner().plan(
      timeline: timeline,
      voice: voice,
      style: style,
    );

    return ExportEngine().export(job);
  }
}