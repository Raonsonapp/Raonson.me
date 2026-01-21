import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/generation_notifier.dart';
import '../state/generation_status.dart';
import 'generator_task_tile.dart';
import 'generator_empty_view.dart';

class GeneratorScreen extends ConsumerWidget {
  const GeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(generationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KING AI · Generator'),
      ),
      body: state.tasks.isEmpty
          ? const GeneratorEmptyView()
          : ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return GeneratorTaskTile(task: task);
              },
            ),
    );
  }
}