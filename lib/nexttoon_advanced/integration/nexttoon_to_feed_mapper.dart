import '../models/episode_model.dart';

class FeedItemModel {
  final String id;
  final String title;
  final String videoPath;
  final DateTime createdAt;

  FeedItemModel({
    required this.id,
    required this.title,
    required this.videoPath,
    required this.createdAt,
  });
}

class NextToonToFeedMapper {
  FeedItemModel map(EpisodeModel episode) {
    return FeedItemModel(
      id: episode.id,
      title: episode.title,
      videoPath: episode.videoPath,
      createdAt: episode.createdAt,
    );
  }
}