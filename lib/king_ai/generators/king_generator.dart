import 'generation_request.dart';
import 'generation_result.dart';
import 'generator_registry.dart';

class KingGenerator {
  Future<GenerationResult> generate(GenerationRequest request) async {
    final generator = GeneratorRegistry.get(request.type);

    if (generator == null) {
      throw Exception('Generator not found: ${request.type}');
    }

    final files = await generator.generate(request);

    return GenerationResult(
      type: request.type,
      createdAt: DateTime.now(),
      files: files,
    );
  }
}