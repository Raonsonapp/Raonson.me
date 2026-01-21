import 'nexttoon_pipeline.dart';
import 'nexttoon_motion_engine.dart';
import 'nexttoon_voice_engine.dart';
import 'nexttoon_render_engine.dart';
import 'generation_result.dart';

class NextToonOrchestrator {
  List<GeneratedFile> generateFullEpisode({
    required int minutes,
    required String style,
    required String language,
  }) {
    final pipeline = NextToonPipeline();
    final render = NextToonRenderEngine();

    final files = pipeline.buildEpisode(
      minutes: minutes,
      style: style,
      language: language,
    );

    final renderMeta = render.render(
      scenes: minutes * 6,
      minutes: minutes,
    );

    files.add(
      GeneratedFile(
        path: 'nexttoon/render/result.json',
        content: renderMeta.toString(),
      ),
    );

    return files;
  }
}