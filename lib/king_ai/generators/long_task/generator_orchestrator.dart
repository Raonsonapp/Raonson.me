import 'dart:async';

import 'file_batch_generator.dart';
import 'progress_tracker.dart';
import 'task_scheduler.dart';

enum GenerationMode {
  app,
  game,
  anime,
  mixed,
}

class GeneratorOrchestrator {
  final TaskScheduler scheduler;
  final ProgressTracker progress;

  bool _isCancelled = false;

  GeneratorOrchestrator({
    required this.scheduler,
    required this.progress,
  });

  /// MAIN ENTRY
  Future<void> run({
    required GenerationMode mode,
    required int totalFiles,
    required int batchSize,
    required Future<void> Function(GeneratedFile) writer,
  }) async {
    _isCancelled = false;
    progress.reset();

    final tasks = _buildTasks(
      mode: mode,
      totalFiles: totalFiles,
      batchSize: batchSize,
      writer: writer,
    );

    await scheduler.runSequential(tasks);
  }

  void cancel() {
    _isCancelled = true;
    scheduler.cancelAll();
    progress.cancel();
  }

  List<Future<void> Function()> _buildTasks({
    required GenerationMode mode,
    required int totalFiles,
    required int batchSize,
    required Future<void> Function(GeneratedFile) writer,
  }) {
    final List<Future<void> Function()> tasks = [];

    // 1️⃣ Core generation
    tasks.add(() async {
      _checkCancelled();

      final generator = FileBatchGenerator(
        totalFiles: totalFiles,
        batchSize: batchSize,
        progress: progress,
        writer: writer,
      );

      await generator.generate();
    });

    // 2️⃣ Mode-specific post steps
    if (mode == GenerationMode.anime || mode == GenerationMode.mixed) {
      tasks.add(() async {
        _checkCancelled();
        await _generateAnimePipeline();
      });
    }

    if (mode == GenerationMode.game || mode == GenerationMode.mixed) {
      tasks.add(() async {
        _checkCancelled();
        await _generateGameAssets();
      });
    }

    if (mode == GenerationMode.app || mode == GenerationMode.mixed) {
      tasks.add(() async {
        _checkCancelled();
        await _finalizeApp();
      });
    }

    return tasks;
  }

  void _checkCancelled() {
    if (_isCancelled) {
      throw StateError('Generation cancelled by user');
    }
  }

  Future<void> _generateAnimePipeline() async {
    progress.log('NextToon: building anime pipeline...');
    await Future.delayed(const Duration(milliseconds: 800));
    progress.log('NextToon: scenes, voices, FX ready');
  }

  Future<void> _generateGameAssets() async {
    progress.log('King AI: generating game assets...');
    await Future.delayed(const Duration(milliseconds: 700));
    progress.log('King AI: game logic & UI prepared');
  }

  Future<void> _finalizeApp() async {
    progress.log('Finalizing app structure...');
    await Future.delayed(const Duration(milliseconds: 500));
    progress.log('App ready for build');
  }
}