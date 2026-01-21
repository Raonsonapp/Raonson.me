class EpisodeModel {
  final String id;
  final String title;
  final String videoPath;
  final DateTime createdAt;
  final bool isDraft;

  EpisodeModel({
    required this.id,
    required this.title,
    required this.videoPath,
    required this.createdAt,
    this.isDraft = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'videoPath': videoPath,
        'createdAt': createdAt.toIso8601String(),
        'isDraft': isDraft,
      };

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      title: json['title'],
      videoPath: json['videoPath'],
      createdAt: DateTime.parse(json['createdAt']),
      isDraft: json['isDraft'] ?? false,
    );
  }
}