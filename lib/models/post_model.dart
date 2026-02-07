class Post {
  final String id;
  final String username;
  final String caption;

  Post({
    required this.id,
    required this.username,
    required this.caption,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'].toString(),
      username: json['username'] ?? '',
      caption: json['caption'] ?? '',
    );
  }
}
