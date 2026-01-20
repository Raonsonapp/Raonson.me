import 'pipeline_stage.dart';
import 'pipeline_context.dart';
import 'pipeline_result.dart';

abstract class GenerationPipeline {
  PipelineStage get stage;

  Future<void> execute(PipelineContext context);

  Future<PipelineResult> run(PipelineContext context) async {
    try {
      await execute(context);
      return PipelineResult.success(null);
    } catch (e) {
      return PipelineResult.failure(e.toString());
    }
  }
}