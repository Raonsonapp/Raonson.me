import 'package:flutter/material.dart';

import '../state/generation_task.dart';
import '../state/generation_status.dart';
import 'generator_progress_bar.dart';
import 'generator_status_badge.dart';

class GeneratorTaskTile extends StatelessWidget {
  final GenerationTask task;

  const GeneratorTaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.request.prompt,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GeneratorProgressBar(progress: task.progress),
            const SizedBox(height: 6),
            GeneratorStatusBadge(status: task.status),
            if (task.error != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  task.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}