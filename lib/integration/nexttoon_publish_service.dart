import '../models/episode_model.dart';
import '../storage/episode_storage.dart';

class NextToonPublishService {
  final EpisodeStorage _storage = EpisodeStorage();

  Future<void> publishEpisode(EpisodeModel episode) async {
    final published = EpisodeModel(
      id: episode.id,
      title: episode.title,
      videoPath: episode.videoPath,
      createdAt: episode.createdAt,
      isDraft: false,
    );

    await _storage.saveEpisode(published);
  }
}