import 'generation_request.dart';
import 'generation_result.dart';

class NextToonPipeline {
  List<GeneratedFile> buildEpisode({
    required int minutes,
    required String style,
    required String language,
  }) {
    final scenes = _buildScenes(minutes);
    final timeline = _buildTimeline(scenes);

    return [
      GeneratedFile(
        path: 'nexttoon/episode/meta.json',
        content: '''
{
  "duration": $minutes,
  "style": "$style",
  "language": "$language",
  "scenes": ${scenes.length}
}
''',
      ),
      GeneratedFile(
        path: 'nexttoon/episode/timeline.json',
        content: timeline,
      ),
    ];
  }

  List<Map<String, dynamic>> _buildScenes(int minutes) {
    final sceneCount = minutes * 6; // ~10 sec per scene
    return List.generate(sceneCount, (i) {
      return {
        "scene": i + 1,
        "motion": "anime_motion",
        "camera": "dynamic",
        "fx": true
      };
    });
  }

  String _buildTimeline(List<Map<String, dynamic>> scenes) {
    return '''
{
  "timeline": ${scenes.map((e) => e["scene"]).toList()}
}
''';
  }
}