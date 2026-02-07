class PostModel {
  final String id;
  final String username;
  final String caption;
  final String mediaUrl;
  final bool isVideo;

  PostModel({
    required this.id,
    required this.username,
    required this.caption,
    required this.mediaUrl,
    required this.isVideo,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      username: json['username'] ?? '',
      caption: json['caption'] ?? '',
      mediaUrl: json['media_url'] ?? '',
      isVideo: json['is_video'] ?? false,
    );
  }
}
