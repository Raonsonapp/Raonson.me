import 'frame_generator.dart';
import 'frame_render_pipeline.dart';
import 'video_encoder.dart';
import 'render_job.dart';

class RenderController {
  final FrameGenerator generator;
  final FrameRenderPipeline pipeline;
  final VideoEncoder encoder;

  RenderController(
    this.generator,
    this.pipeline,
    this.encoder,
  );

  Future<void> render(RenderJob job) async {
    final buffer = generator.generate(job.duration);
    pipeline.render(buffer);
    // encoder.encode(...)
  }
}