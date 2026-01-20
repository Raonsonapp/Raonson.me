import 'generator_engine.dart';
import 'generator_request.dart';
import 'generator_response.dart';

class GeneratorOrchestrator {
  final GeneratorEngine _engine = GeneratorEngine();

  GeneratorResponse run({
    required GenerationType type,
    required String prompt,
    bool advanced = false,
  }) {
    final request = GeneratorRequest(
      type: type,
      prompt: prompt,
      advanced: advanced,
    );

    return _engine.generate(request);
  }
}