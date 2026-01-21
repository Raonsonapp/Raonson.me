import 'generation_request.dart';
import 'generation_result.dart';
import 'generator_registry.dart';

class AnimeGenerator extends BaseGenerator {
  @override
  Future<List<GeneratedFile>> generate(GenerationRequest request) async {
    final duration = request.option<int>('minutes') ?? 10;

    return [
      GeneratedFile(
        path: 'anime/episode.json',
        content: '''
{
  "duration_minutes": $duration,
  "style": "anime",
  "quality": "studio",
  "engine": "NextToon"
}
''',
      ),
    ];
  }
}