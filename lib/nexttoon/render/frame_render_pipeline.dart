import 'frame_buffer.dart';
import 'scene_renderer.dart';

class FrameRenderPipeline {
  final SceneRenderer renderer;

  FrameRenderPipeline(this.renderer);

  void render(FrameBuffer buffer) {
    for (final frame in buffer.frames) {
      renderer.renderFrame(frame);
    }
  }
}