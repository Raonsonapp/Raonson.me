class FeedPost {
  final String id;
  final String userId;
  final String username;
  final String content;
  final String? mediaUrl;
  final int likes;
  final int comments;
  final bool liked;

  FeedPost({
    required this.id,
    required this.userId,
    required this.username,
    required this.content,
    this.mediaUrl,
    this.likes = 0,
    this.comments = 0,
    this.liked = false,
  false});

  FeedPost copyWith({
    int? likes,
    int? comments,
    bool? liked,
  }) {
    return FeedPost(
      id: id,
      userId: userId,
      username: username,
      content: content,
      mediaUrl: mediaUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      liked: liked ?? this.liked,
    );
  }
}
