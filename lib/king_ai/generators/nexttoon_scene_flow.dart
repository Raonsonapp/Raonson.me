import 'nexttoon_pipeline.dart';
import 'nexttoon_scene_compiler.dart';
import 'nexttoon_scene_exporter.dart';

class NextToonSceneFlow {
  List exportFullSceneFlow(int minutes) {
    final pipeline = NextToonPipeline();
    final compiler = SceneCompiler();
    final exporter = SceneExporter();

    pipeline.buildEpisode(
      minutes: minutes,
      style: "anime",
      language: "jp",
    );

    final scenes = compiler.compileScenes(minutes);
    return exporter.export(scenes);
  }
}