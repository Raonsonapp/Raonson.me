import '../models/dubbing_task.dart';

class DubbingPipeline {
  Future<void> process(DubbingTask task) async {
    for (int i = 1; i <= 20; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      task.progress = i / 20;
    }
  }
}