class Post {
  final String id;
  final String user;
  final String imageUrl;
  int likes;
  bool liked;

  Post({
    required this.id,
    required this.user,
    required this.imageUrl,
    this.likes = 0,
    this.liked = false,
  });
}
