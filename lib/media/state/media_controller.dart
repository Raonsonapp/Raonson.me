// media/state/media_controller.dart

import 'package:flutter/foundation.dart';
import 'media_state.dart';
import '../models/video_media_model.dart';
import '../models/audio_track_model.dart';

class MediaController extends ChangeNotifier {
  MediaState _state = const MediaState(status: MediaStatus.idle);

  MediaState get state => _state;

  void load(VideoMedia video) {
    _state = _state.copyWith(
      status: MediaStatus.loading,
      video: video,
      position: Duration.zero,
    );
    notifyListeners();
  }

  void play() {
    _state = _state.copyWith(status: MediaStatus.playing);
    notifyListeners();
  }

  void pause() {
    _state = _state.copyWith(status: MediaStatus.paused);
    notifyListeners();
  }

  void buffer() {
    _state = _state.copyWith(status: MediaStatus.buffering);
    notifyListeners();
  }

  void seek(Duration position) {
    _state = _state.copyWith(position: position);
    notifyListeners();
  }

  void changeQuality(VideoQuality quality) {
    _state = _state.copyWith(quality: quality);
    notifyListeners();
  }

  void changeAudio(AudioTrack track) {
    _state = _state.copyWith(audioTrack: track);
    notifyListeners();
  }

  void toggleFullscreen() {
    _state = _state.copyWith(isFullscreen: !_state.isFullscreen);
    notifyListeners();
  }

  void stop() {
    _state = const MediaState(status: MediaStatus.idle);
    notifyListeners();
  }
}
