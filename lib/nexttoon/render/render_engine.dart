import 'render_job.dart';

class RenderEngine {
  void render(RenderJob job) {
    for (int i = 0; i < job.totalFrames; i++) {
      _renderFrame(i, job);
    }
  }

  void _renderFrame(int frame, RenderJob job) {
    // later: GPU / FFmpeg / backend render
    // now: logical simulation
  }
}