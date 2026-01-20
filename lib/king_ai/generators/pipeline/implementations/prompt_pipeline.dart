import '../generation_pipeline.dart';
import '../pipeline_stage.dart';
import '../pipeline_context.dart';

class PromptPipeline extends GenerationPipeline {
  @override
  PipelineStage get stage => PipelineStage.prompt;

  @override
  Future<void> execute(PipelineContext context) async {
    context.update(0.05, 'Analyzing prompt');

    final prompt = context.request.prompt;

    // Дар оянда: LLM (GPT / Gemini / Local)
    context.data['idea'] = {
      'genre': context.request.genre,
      'theme': 'anime',
      'rawPrompt': prompt,
    };

    await Future.delayed(const Duration(milliseconds: 500));
  }
}