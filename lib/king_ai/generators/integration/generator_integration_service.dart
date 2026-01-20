import '../pipeline/pipeline_executor.dart';
import '../pipeline/pipeline_context.dart';
import '../pipeline/implementations/prompt_pipeline.dart';
import '../pipeline/implementations/script_pipeline.dart';
import '../pipeline/implementations/scene_pipeline.dart';
import '../pipeline/implementations/animation_pipeline.dart';
import '../pipeline/implementations/export_pipeline.dart';
import '../state/generation_request.dart';

class GeneratorIntegrationService {
  late final PipelineExecutor _executor;

  GeneratorIntegrationService() {
    _executor = PipelineExecutor([
      PromptPipeline(),
      ScriptPipeline(),
      ScenePipeline(),
      AnimationPipeline(),
      ExportPipeline(),
    ]);
  }

  Future<Map<String, dynamic>> run(GenerationRequest request) async {
    final context = PipelineContext(request);
    final result = await _executor.run(context);

    if (!result.success) {
      throw Exception(result.error);
    }

    return context.data;
  }
}