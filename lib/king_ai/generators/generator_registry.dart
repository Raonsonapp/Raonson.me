import 'generation_request.dart';
import 'generation_result.dart';
import 'flutter_generator.dart';
import 'anime_generator.dart';
import 'game_generator.dart';

abstract class BaseGenerator {
  Future<List<GeneratedFile>> generate(GenerationRequest request);
}

class GeneratorRegistry {
  static final Map<String, BaseGenerator> _generators = {
    'flutter': FlutterGenerator(),
    'anime': AnimeGenerator(),
    'game': GameGenerator(),
  };

  static BaseGenerator? get(String type) => _generators[type];
}