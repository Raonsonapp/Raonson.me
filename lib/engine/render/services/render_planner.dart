import '../../scene/core/timeline.dart';
import '../../voice/voice_engine.dart';
import '../../style/style_engine.dart';
import '../core/render_job.dart';
import '../core/video_format.dart';

class RenderPlanner {
  RenderJob plan({
    required Timeline timeline,
    required VoiceResult voice,
    required StyleResult style,
  }) {
    final fps = 24; // anime standard
    final frames = (timeline.totalDuration * fps).round();

    return RenderJob(
      totalFrames: frames,
      fps: fps,
      format: VideoFormat.mp4_1080p,
    );
  }
}