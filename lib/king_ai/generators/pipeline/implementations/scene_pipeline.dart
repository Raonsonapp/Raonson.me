import '../generation_pipeline.dart';
import '../pipeline_stage.dart';
import '../pipeline_context.dart';

class ScenePipeline extends GenerationPipeline {
  @override
  PipelineStage get stage => PipelineStage.assets;

  @override
  Future<void> execute(PipelineContext context) async {
    context.update(0.35, 'Building scenes');

    final scenes = List.generate(12, (index) {
      return {
        'id': index,
        'environment': 'anime_world',
        'camera': 'cinematic',
        'characters': ['hero', 'enemy'],
      };
    });

    context.data['scenes'] = scenes;

    await Future.delayed(const Duration(seconds: 1));
  }
}