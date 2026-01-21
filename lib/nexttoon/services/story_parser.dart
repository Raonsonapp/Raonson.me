import '../models/story_prompt.dart';
import '../models/anime_scene.dart';

class StoryParser {
  List<AnimeScene> parse(StoryPrompt prompt) {
    final totalSeconds = prompt.targetMinutes * 60;
    final sceneCount = (totalSeconds / 30).round();

    return List.generate(sceneCount, (i) {
      return AnimeScene(
        index: i,
        description: 'Scene ${i + 1}: generated from story',
        durationSeconds: 30,
      );
    });
  }
}