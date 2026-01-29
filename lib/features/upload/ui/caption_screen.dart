import 'package:flutter/material.dart';

class CaptionScreen extends StatelessWidget {
  const CaptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caption'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Share'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Write a caption...',
                      border: InputBorder.none,
                    ),
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
