import 'story_analyzer.dart';
import 'director_ai.dart';
import 'script_input.dart';

class PipelineOrchestrator {
  final StoryAnalyzer analyzer = StoryAnalyzer();
  final DirectorAI director = DirectorAI();

  void run(ScriptInput input) {
    final scenes = analyzer.analyze(input);
    for (final scene in scenes) {
      director.planCamera(scene);
      director.planFx(scene);
    }
  }
}