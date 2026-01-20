import 'dart:async';

/// Ҳолати кор
enum TaskStatus {
  idle,
  running,
  paused,
  completed,
  failed,
}

/// Як зеркор (step)
class TaskStep {
  final String id;
  final String title;
  final Future<void> Function() execute;

  TaskStep({
    required this.id,
    required this.title,
    required this.execute,
  });
}

/// Планировщики кори дарозмуддат
class TaskScheduler {
  final List<TaskStep> _steps = [];
  int _currentIndex = 0;
  TaskStatus _status = TaskStatus.idle;

  TaskStatus get status => _status;
  int get currentStep => _currentIndex;
  int get totalSteps => _steps.length;

  void addStep(TaskStep step) {
    _steps.add(step);
  }

  Future<void> start() async {
    if (_status == TaskStatus.running) return;
    _status = TaskStatus.running;

    try {
      while (_currentIndex < _steps.length &&
          _status == TaskStatus.running) {
        final step = _steps[_currentIndex];
        await step.execute();
        _currentIndex++;
      }

      if (_currentIndex >= _steps.length) {
        _status = TaskStatus.completed;
      }
    } catch (e) {
      _status = TaskStatus.failed;
    }
  }

  void pause() {
    if (_status == TaskStatus.running) {
      _status = TaskStatus.paused;
    }
  }

  void resume() {
    if (_status == TaskStatus.paused) {
      start();
    }
  }

  void reset() {
    _currentIndex = 0;
    _status = TaskStatus.idle;
  }
}