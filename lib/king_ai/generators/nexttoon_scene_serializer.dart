class SceneSerializer {
  String toJson(List<Map<String, dynamic>> scenes) {
    return '''
{
  "compiled_scenes": ${scenes.length},
  "data": $scenes
}
''';
  }
}