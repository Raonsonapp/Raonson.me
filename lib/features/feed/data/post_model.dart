class PostModel {
  final String id;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final String caption;
  final int likes;
  final bool isLiked;

  PostModel({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.caption,
    this.likes = 0,
    this.isLiked = false,
  });
}
