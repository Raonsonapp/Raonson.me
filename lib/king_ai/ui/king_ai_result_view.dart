import 'package:flutter/material.dart';
import '../core/king_ai_result.dart';

class KingAIResultView extends StatelessWidget {
  final KingAIResult? result;

  const KingAIResultView({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const Center(child: Text('No result'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Generated Output',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(result!.summary),
        const SizedBox(height: 16),
        const Text(
          'Files',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...result!.generatedFiles.map(
          (f) => ListTile(
            leading: const Icon(Icons.insert_drive_file),
            title: Text(f),
          ),
        ),
      ],
    );
  }
}