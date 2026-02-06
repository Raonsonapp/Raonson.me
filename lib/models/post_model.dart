class PostModel {
  final int id;
  final String caption;
  final String imageUrl;

  PostModel({
    required this.id,
    required this.caption,
    required this.imageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      caption: json['caption'],
      imageUrl: json['image_url'],
    );
  }
}
