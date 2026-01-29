class ReelModel {
  final String videoUrl;
  final String userName;
  final String caption;
  final int likes;
  final int comments;
  final String avatar;

  ReelModel({
    required this.videoUrl,
    required this.userName,
    required this.caption,
    required this.avatar,
    this.likes = 0,
    this.comments = 0,
  });
}
