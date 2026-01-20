import '../generation_pipeline.dart';
import '../pipeline_stage.dart';
import '../pipeline_context.dart';

class ScriptPipeline extends GenerationPipeline {
  @override
  PipelineStage get stage => PipelineStage.planning;

  @override
  Future<void> execute(PipelineContext context) async {
    context.update(0.15, 'Generating episode script');

    // Дар оянда: breakdown ба диалог, narration, pacing
    context.data['script'] = {
      'durationMinutes': context.request.durationMinutes,
      'acts': 3,
      'scenes': 12,
    };

    await Future.delayed(const Duration(seconds: 1));
  }
}