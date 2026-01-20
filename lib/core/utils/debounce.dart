import 'dart:async';

class Debounce {
  Timer? _timer;

  void run(VoidCallback action, Duration duration) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }
}