import 'generation_request.dart';
import 'generation_result.dart';
import 'generator_registry.dart';

class GameGenerator extends BaseGenerator {
  @override
  Future<List<GeneratedFile>> generate(GenerationRequest request) async {
    return [
      GeneratedFile(
        path: 'game/game_config.json',
        content: '''
{
  "type": "full_game",
  "engine": "KingAI",
  "level": "advanced"
}
''',
      ),
    ];
  }
}