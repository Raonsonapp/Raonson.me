import 'package:flutter/material.dart';
import '../models/dubbing_task.dart';

class DubbingProgress extends StatelessWidget {
  final DubbingTask task;
  const DubbingProgress(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dubbing ${task.targetLang}'),
        LinearProgressIndicator(value: task.progress),
      ],
    );
  }
}