class ReelModel {
  final String videoUrl;
  final String userName;
  final String caption;
  bool isLiked;

  ReelModel({
    required this.videoUrl,
    required this.userName,
    required this.caption,
    this.isLiked = false,
  });
}
