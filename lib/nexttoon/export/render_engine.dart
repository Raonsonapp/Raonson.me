import 'render_config.dart';
import 'scene_render_result.dart';

class RenderEngine {
  SceneRenderResult renderScene(
    String sceneId,
    RenderConfig config,
  ) {
    return SceneRenderResult(
      sceneId: sceneId,
      videoPath: '/tmp/$sceneId.mp4',
      duration: const Duration(minutes: 2),
    );
  }
}