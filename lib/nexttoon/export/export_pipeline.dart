import 'render_engine.dart';
import 'video_merger.dart';
import 'render_config.dart';

class ExportPipeline {
  final RenderEngine engine = RenderEngine();
  final VideoMerger merger = VideoMerger();

  String exportEpisode(List<String> sceneIds) {
    final results = sceneIds
        .map((id) =>
            engine.renderScene(id, RenderConfig(
              width: 1920,
              height: 1080,
              fps: 24,
              format: 'mp4',
            )))
        .toList();

    return merger.merge(results);
  }
}