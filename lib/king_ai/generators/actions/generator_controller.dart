import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/generation_notifier.dart';
import '../state/generation_task.dart';
import 'generator_actions.dart';

final generatorControllerProvider =
    Provider<GeneratorController>((ref) {
  return GeneratorController(ref);
});

class GeneratorController {
  final Ref ref;

  GeneratorController(this.ref);

  void perform(GenerationTask task, GeneratorAction action) {
    final notifier = ref.read(generationProvider.notifier);

    switch (action) {
      case GeneratorAction.start:
        notifier.start(task.id);
        break;
      case GeneratorAction.pause:
        notifier.pause(task.id);
        break;
      case GeneratorAction.resume:
        notifier.resume(task.id);
        break;
      case GeneratorAction.cancel:
        notifier.cancel(task.id);
        break;
    }
  }
}