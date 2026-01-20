import 'dart:async';

class ProgressSnapshot {
  final double percent; // 0 - 100
  final int completedSteps;
  final int totalSteps;
  final Duration elapsed;
  final Duration? estimatedRemaining;
  final int generatedFiles;

  ProgressSnapshot({
    required this.percent,
    required this.completedSteps,
    required this.totalSteps,
    required this.elapsed,
    required this.estimatedRemaining,
    required this.generatedFiles,
  });
}

class ProgressTracker {
  final int totalSteps;
  final Stopwatch _stopwatch = Stopwatch();
  int _completedSteps = 0;
  int _generatedFiles = 0;

  final StreamController<ProgressSnapshot> _controller =
      StreamController.broadcast();

  Stream<ProgressSnapshot> get stream => _controller.stream;

  ProgressTracker({required this.totalSteps});

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _emit();
    }
  }

  void stepCompleted({int generatedFiles = 0}) {
    _completedSteps++;
    _generatedFiles += generatedFiles;
    _emit();
  }

  void addGeneratedFiles(int count) {
    _generatedFiles += count;
    _emit();
  }

  void complete() {
    _completedSteps = totalSteps;
    _emit(finalEmit: true);
    _stopwatch.stop();
  }

  void _emit({bool finalEmit = false}) {
    final elapsed = _stopwatch.elapsed;

    double percent = totalSteps == 0
        ? 0
        : (_completedSteps / totalSteps) * 100;

    Duration? remaining;
    if (_completedSteps > 0 && !finalEmit) {
      final avgPerStep =
          elapsed.inMilliseconds / _completedSteps;
      final remainingSteps = totalSteps - _completedSteps;
      remaining = Duration(
        milliseconds: (avgPerStep * remainingSteps).round(),
      );
    }

    _controller.add(
      ProgressSnapshot(
        percent: percent.clamp(0, 100),
        completedSteps: _completedSteps,
        totalSteps: totalSteps,
        elapsed: elapsed,
        estimatedRemaining: remaining,
        generatedFiles: _generatedFiles,
      ),
    );
  }

  void dispose() {
    _controller.close();
  }
}