import '../generation_pipeline.dart';
import '../pipeline_stage.dart';
import '../pipeline_context.dart';

class ExportPipeline extends GenerationPipeline {
  @override
  PipelineStage get stage => PipelineStage.exporting;

  @override
  Future<void> execute(PipelineContext context) async {
    context.update(0.95, 'Exporting episode');

    // Дар оянда:
    // - Video encoder
    // - Dub / multi-language
    context.data['output'] = {
      'path': '/storage/emulated/0/raonson/episode.mp4',
      'format': 'mp4',
      'duration': context.request.durationMinutes,
    };

    await Future.delayed(const Duration(milliseconds: 700));
  }
}