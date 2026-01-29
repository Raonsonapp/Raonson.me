class ReelModel {
  final String id;
  final String username;
  final String userAvatar;
  final String mediaUrl; // image/video placeholder
  final String caption;
  final int likes;
  final bool isLiked;

  ReelModel({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.mediaUrl,
    required this.caption,
    this.likes = 0,
    this.isLiked = false,
  });
}
