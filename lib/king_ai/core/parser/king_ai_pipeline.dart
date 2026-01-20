import 'king_prompt_parser.dart';
import 'parser_to_core_adapter.dart';
import '../core/king_ai_engine.dart';

class KingAIPipeline {
  final _parser = KingPromptParser();
  final _adapter = ParserToCoreAdapter();
  final _engine = KingAIEngine();

  Future<void> run(String userPrompt) async {
    final intent = _parser.parse(userPrompt);
    final request = _adapter.convert(intent, userPrompt);
    final files = await _engine.generate(request);

    for (final f in files) {
      print('Generated: ${f.path}');
    }
  }
}
