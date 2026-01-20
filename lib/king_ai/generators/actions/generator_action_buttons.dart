import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/generation_task.dart';
import '../state/generation_status.dart';
import 'generator_controller.dart';
import 'generator_actions.dart';

class GeneratorActionButtons extends ConsumerWidget {
  final GenerationTask task;

  const GeneratorActionButtons({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(generatorControllerProvider);

    List<Widget> buttons = [];

    if (task.status == GenerationStatus.queued) {
      buttons.add(_btn(Icons.play_arrow, () {
        controller.perform(task, GeneratorAction.start);
      }));
    }

    if (task.status == GenerationStatus.running) {
      buttons.add(_btn(Icons.pause, () {
        controller.perform(task, GeneratorAction.pause);
      }));
    }

    if (task.status == GenerationStatus.paused) {
      buttons.add(_btn(Icons.play_arrow, () {
        controller.perform(task, GeneratorAction.resume);
      }));
    }

    if (!task.isFinished) {
      buttons.add(_btn(Icons.stop, () {
        controller.perform(task, GeneratorAction.cancel);
      }));
    }

    return Row(children: buttons);
  }

  Widget _btn(IconData icon, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onTap,
    );
  }
}
