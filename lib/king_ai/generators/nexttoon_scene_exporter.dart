import 'generation_result.dart';

class SceneExporter {
  List<GeneratedFile> export(List<Map<String, dynamic>> scenes) {
    return [
      GeneratedFile(
        path: 'nexttoon/scenes/compiled_scenes.json',
        content: scenes.toString(),
      ),
    ];
  }
}