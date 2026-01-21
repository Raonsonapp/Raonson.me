import 'video_composer.dart';
import 'episode_structure.dart';
import 'composer_result.dart';

class ComposerController {
  final VideoComposer composer = VideoComposer();

  ComposerResult run(EpisodeStructure episode) {
    return composer.compose(episode);
  }
}