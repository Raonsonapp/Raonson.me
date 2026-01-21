// media/state/media_state.dart

import '../models/video_media_model.dart';
import '../models/audio_track_model.dart';

enum MediaStatus {
  idle,
  loading,
  playing,
  paused,
  buffering,
  error,
}

class MediaState {
  final MediaStatus status;
  final VideoMedia? video;
  final VideoQuality quality;
  final AudioTrack? audioTrack;
  final Duration position;
  final bool isFullscreen;

  const MediaState({
    required this.status,
    this.video,
    this.audioTrack,
    this.quality = VideoQuality.q720,
    this.position = Duration.zero,
    this.isFullscreen = false,
  });

  MediaState copyWith({
    MediaStatus? status,
    VideoMedia? video,
    VideoQuality? quality,
    AudioTrack? audioTrack,
    Duration? position,
    bool? isFullscreen,
  }) {
    return MediaState(
      status: status ?? this.status,
      video: video ?? this.video,
      quality: quality ?? this.quality,
      audioTrack: audioTrack ?? this.audioTrack,
      position: position ?? this.position,
      isFullscreen: isFullscreen ?? this.isFullscreen,
    );
  }
}