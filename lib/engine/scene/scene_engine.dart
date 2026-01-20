import 'core/scene.dart';
import 'services/scene_builder.dart';
import 'services/timeline_compiler.dart';

class SceneEngine {
  SceneEngine._();
  static final instance = SceneEngine._();

  Future<Timeline> generate({
    required List<Scene> scenes,
  }) async {
    final expanded = SceneBuilder().expand(scenes);
    return TimelineCompiler().compile(expanded);
  }
}