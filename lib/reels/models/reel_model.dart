class ReelModel {
  final String id;
  final String videoUrl;
  final String author;
  final int likes;
  final int comments;

  ReelModel({
    required this.id,
    required this.videoUrl,
    required this.author,
    this.likes = 0,
    this.comments = 0,
  });
}
