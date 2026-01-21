import '../models/anime_episode.dart';
import '../models/story_prompt.dart';
import '../state/nexttoon_state.dart';
import 'story_parser.dart';
import 'scene_planner.dart';
import 'animation_engine.dart';
import 'voice_engine.dart';
import 'fx_engine.dart';

class EpisodeBuilder {
  final StoryParser parser = StoryParser();
  final ScenePlanner planner = ScenePlanner();
  final AnimationEngine animator = AnimationEngine();
  final VoiceEngine voice = VoiceEngine();
  final FXEngine fx = FXEngine();

  Future<AnimeEpisode> build(
    StoryPrompt prompt,
    NextToonState state,
  ) async {
    state.update(0.1, 'Parsing story');
    final scenes = parser.parse(prompt);

    state.update(0.2, 'Planning scenes');
    planner.enhance(scenes);

    int done = 0;
    for (var s in scenes) {
      fx.applyFX(s, prompt.style);
      await animator.render(s, prompt.style);
      await voice.generateVoice(s, 'ja');
      done++;
      state.update(0.2 + (0.7 * done / scenes.length), 'Rendering');
    }

    state.update(1.0, 'Completed');

    return AnimeEpisode(
      title: 'NextToon Episode',
      scenes: scenes,
    );
  }
}