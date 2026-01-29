class StoryModel {
  final String username;
  final String avatarUrl;
  final bool isViewed;

  StoryModel({
    required this.username,
    required this.avatarUrl,
    this.isViewed = false,
  });
}
