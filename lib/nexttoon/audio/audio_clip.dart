import 'audio_type.dart';

class AudioClip {
  final String id;
  final AudioType type;
  final Duration start;
  final Duration duration;
  final double volume; // 0.0 - 1.0
  final String source; // path or url

  AudioClip({
    required this.id,
    required this.type,
    required this.start,
    required this.duration,
    required this.volume,
    required this.source,
  });
}
