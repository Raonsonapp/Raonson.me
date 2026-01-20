import '../core/render_job.dart';
import '../core/render_result.dart';

class ExportEngine {
  Future<RenderResult> export(RenderJob job) async {
    final seconds = job.totalFrames / job.fps;

    return RenderResult(
      filePath: 'output/nexttoon_episode.mp4',
      durationSeconds: seconds,
      resolution: '1080p',
    );
  }
}