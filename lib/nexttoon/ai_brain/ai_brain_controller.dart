import 'script_input.dart';
import 'pipeline_orchestrator.dart';

class AIBrainController {
  final PipelineOrchestrator orchestrator =
      PipelineOrchestrator();

  void generateAnime(ScriptInput input) {
    orchestrator.run(input);
  }
}
