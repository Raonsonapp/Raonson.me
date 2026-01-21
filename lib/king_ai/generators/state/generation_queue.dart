import 'generation_task.dart';

class GenerationQueue {
  final List<GenerationTask> _queue = [];

  void add(GenerationTask task) {
    _queue.add(task);
  }

  GenerationTask? next() {
    if (_queue.isEmpty) return null;
    return _queue.removeAt(0);
  }

  bool get isEmpty => _queue.isEmpty;
}