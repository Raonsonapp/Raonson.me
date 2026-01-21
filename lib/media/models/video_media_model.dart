// media/models/video_media_model.dart

enum VideoQuality {
  q360,
  q480,
  q720,
  q1080,
}

class VideoMedia {
  final String id;
  final String title;
  final String url;
  final Duration duration;
  final Map<VideoQuality, String> qualityUrls;
  final String thumbnailUrl;
  final bool isLive;

  const VideoMedia({
    required this.id,
    required this.title,
    required this.url,
    required this.duration,
    required this.qualityUrls,
    required this.thumbnailUrl,
    this.isLive = false,
  });

  String urlByQuality(VideoQuality quality) {
    return qualityUrls[quality] ?? url;
  }
}