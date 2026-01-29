class PostModel {
  final String username;
  final String userAvatar;
  final String imageUrl;
  final String caption;
  final int likes;

  PostModel({
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.caption,
    required this.likes,
  });
}
