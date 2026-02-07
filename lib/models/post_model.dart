class PostModel {
  final int id;
  final String username;
  final String caption;
  final int likes;

  PostModel({
    required this.id,
    required this.username,
    required this.caption,
    required this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      username: json['username'],
      caption: json['caption'],
      likes: json['likes'],
    );
  }
}
