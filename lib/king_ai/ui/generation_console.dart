import 'package:flutter/material.dart';

import '../generators/long_task/generator_orchestrator.dart';
import '../generators/long_task/progress_tracker.dart';
import '../generators/long_task/task_scheduler.dart';

class GenerationConsole extends StatefulWidget {
  const GenerationConsole({super.key});

  @override
  State<GenerationConsole> createState() => _GenerationConsoleState();
}

class _GenerationConsoleState extends State<GenerationConsole> {
  late final ProgressTracker _progress;
  late final GeneratorOrchestrator _orchestrator;

  bool _running = false;
  String _status = 'Idle';

  @override
  void initState() {
    super.initState();

    _progress = ProgressTracker(onUpdate: () {
      if (mounted) setState(() {});
    });

    _orchestrator = GeneratorOrchestrator(
      scheduler: TaskScheduler(),
      progress: _progress,
    );
  }

  Future<void> _start() async {
    setState(() {
      _running = true;
      _status = 'Generating...';
    });

    try {
      await _orchestrator.run(
        mode: GenerationMode.mixed,
        totalFiles: 800,
        batchSize: 20,
        writer: (file) async {
          // placeholder for real FS writer
          await Future.delayed(const Duration(milliseconds: 5));
        },
      );

      setState(() => _status = 'Completed');
    } catch (e) {
      setState(() => _status = 'Stopped');
    } finally {
      setState(() => _running = false);
    }
  }

  void _cancel() {
    _orchestrator.cancel();
    setState(() => _status = 'Cancelled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('King AI Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_status, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: _progress.percent,
              minHeight: 8,
            ),

            const SizedBox(height: 8),
            Text(
              '${_progress.generated}/${_progress.total} files',
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: ListView(
                  children: _progress.logs
                      .map((e) => Text(e, style: const TextStyle(fontSize: 12)))
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _running ? null : _start,
                    child: const Text('START'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _running ? _cancel : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('CANCEL'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
