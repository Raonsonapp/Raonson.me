import 'script_input.dart';
import 'scene_plan.dart';

class StoryAnalyzer {
  List<ScenePlan> analyze(ScriptInput input) {
    // AI / NLP hook
    return [
      ScenePlan(
        sceneId: 'scene_1',
        duration: const Duration(minutes: 2),
        description: 'Opening battle',
      ),
    ];
  }
}