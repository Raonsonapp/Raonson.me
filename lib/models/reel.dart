class Reel {
  final int id;
  final String username;
  final String videoUrl;
  final String caption;
  final int likes;

  Reel({
    required this.id,
    required this.username,
    required this.videoUrl,
    required this.caption,
    required this.likes,
  });

  factory Reel.fromJson(Map<String, dynamic> json) {
    return Reel(
      id: json['id'],
      username: json['username'],
      videoUrl: json['video_url'],
      caption: json['caption'] ?? '',
      likes: json['likes'] ?? 0,
    );
  }
}
