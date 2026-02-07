class Post {
  final int id;
  final String username;
  final String imageUrl;
  final String caption;
  final int likes;

  Post({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.caption,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      username: json['username'],
      imageUrl: json['image_url'],
      caption: json['caption'] ?? '',
      likes: json['likes'] ?? 0,
    );
  }
}
