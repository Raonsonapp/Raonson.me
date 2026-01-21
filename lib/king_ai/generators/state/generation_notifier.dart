import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/generator_engine.dart';
import '../core/generator_response.dart';
import 'generation_state.dart';
import 'generation_task.dart';
import 'generation_status.dart';
import 'generation_queue.dart';

class GenerationNotifier extends StateNotifier<GenerationState> {
  GenerationNotifier() : super(const GenerationState());

  final GenerationQueue _queue = GenerationQueue();
  final GeneratorEngine _engine = GeneratorEngine();
  bool _running = false;

  void addTask(GenerationTask task) {
    _queue.add(task);
    state = state.copyWith(tasks: [...state.tasks, task]);
    _tryRun();
  }

  void _tryRun() {
    if (_running) return;
    final task = _queue.next();
    if (task == null) return;

    _running = true;
    _runTask(task);
  }

  Future<void> _runTask(GenerationTask task) async {
    task.status = GenerationStatus.running;
    _emit();

    try {
      for (int i = 1; i <= 10; i++) {
        await Future.delayed(const Duration(seconds: 1));
        task.progress = i / 10;
        _emit();
      }

      _engine.generate(task.request);

      task.status = GenerationStatus.completed;
      task.progress = 1.0;
    } catch (e) {
      task.status = GenerationStatus.failed;
      task.error = e.toString();
    }

    _emit();
    _running = false;
    _tryRun();
  }

  void _emit() {
    state = state.copyWith(tasks: [...state.tasks]);
  }
}

final generationProvider =
    StateNotifierProvider<GenerationNotifier, GenerationState>(
  (ref) => GenerationNotifier(),
);
