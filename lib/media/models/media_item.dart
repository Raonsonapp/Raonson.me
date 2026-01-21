import 'media_quality.dart';

class MediaItem {
  final String id;
  final String url;
  final Duration duration;
  final List<MediaQuality> qualities;

  MediaItem({
    required this.id,
    required this.url,
    required this.duration,
    required this.qualities,
  });
}