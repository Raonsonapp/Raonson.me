class PostModel {
  final String userName;
  final String userAvatar;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final bool isLiked;

  PostModel({
    required this.userName,
    required this.userAvatar,
    required this.imageUrl,
    required this.caption,
    this.likes = 0,
    this.comments = 0,
    this.isLiked = false,
  });
}
