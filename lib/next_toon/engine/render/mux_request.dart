import 'audio_track.dart';
import 'video_track.dart';
import 'render_quality.dart';

class MuxRequest {
  final VideoTrack video;
  final List<AudioTrack> audioTracks;
  final RenderQuality quality;

  MuxRequest({
    required this.video,
    required this.audioTracks,
    required this.quality,
  });
}