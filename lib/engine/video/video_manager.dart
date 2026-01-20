import 'core/episode.dart';
import 'services/video_renderer.dart';

class VideoManager {
  VideoManager._();
  static final instance = VideoManager._();

  Future<void> renderEpisode(Episode episode) async {
    await VideoRenderer().render(episode);
  }
}