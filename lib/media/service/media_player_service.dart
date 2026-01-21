// media/services/media_player_service.dart

import 'dart:async';

class MediaPlayerService {
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  Timer? _timer;

  void play(void Function(Duration) onTick) {
    _isPlaying = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isPlaying) {
        _position += const Duration(seconds: 1);
        onTick(_position);
      }
    });
  }

  void pause() {
    _isPlaying = false;
  }

  void seek(Duration position) {
    _position = position;
  }

  Duration get position => _position;

  bool get isPlaying => _isPlaying;

  void dispose() {
    _timer?.cancel();
  }
}