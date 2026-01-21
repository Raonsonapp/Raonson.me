import 'episode_structure.dart';
import 'composer_result.dart';

class VideoComposer {
  ComposerResult compose(EpisodeStructure episode, {int fps = 24}) {
    final totalFrames =
        (episode.duration.inMilliseconds / (1000 / fps)).round();

    return ComposerResult(
      totalFrames: totalFrames,
      duration: episode.duration,
      outputId: 'episode_${episode.episodeId}',
    );
  }
}