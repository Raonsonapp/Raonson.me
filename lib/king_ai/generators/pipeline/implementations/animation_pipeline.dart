import '../generation_pipeline.dart';
import '../pipeline_stage.dart';
import '../pipeline_context.dart';

class AnimationPipeline extends GenerationPipeline {
  @override
  PipelineStage get stage => PipelineStage.rendering;

  @override
  Future<void> execute(PipelineContext context) async {
    context.update(0.65, 'Rendering animation');

    // Дар оянда:
    // - 2D / 2.5D / 3D
    // - FX (energy, slash, aura)
    context.data['frames'] = {
      'fps': 24,
      'style': context.request.style,
      'quality': 'studio',
    };

    await Future.delayed(const Duration(seconds: 2));
  }
}
