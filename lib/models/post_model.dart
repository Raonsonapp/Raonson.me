class Post {
  final String id;
  final String username;
  final String caption;

  Post({
    required this.id,
    required this.username,
    required this.caption,
  });

  factory Post.fromJson(Map j) {
    return Post(
      id: j['id'].toString(),
      username: j['username'],
      caption: j['caption'] ?? '',
    );
  }
}
