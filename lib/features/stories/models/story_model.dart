class StoryModel {
  final String username;
  final String imageUrl;
  final bool viewed;

  StoryModel({
    required this.username,
    required this.imageUrl,
    this.viewed = false,
  });
}
