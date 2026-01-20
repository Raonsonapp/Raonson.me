import 'pipeline_stage.dart';
import 'pipeline_context.dart';
import 'pipeline_result.dart';
import 'generation_pipeline.dart';

class PipelineExecutor {
  final List<GenerationPipeline> pipelines;

  PipelineExecutor(this.pipelines);

  Future<PipelineResult> run(PipelineContext context) async {
    for (final pipeline in pipelines) {
      context.currentMessage = pipeline.stage.name;
      final result = await pipeline.run(context);

      if (!result.success) {
        return result;
      }
    }
    return PipelineResult.success(null);
  }
}