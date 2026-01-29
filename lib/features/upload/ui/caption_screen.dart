import 'package:flutter/material.dart';

class CaptionScreen extends StatelessWidget {
  final int mediaId;
  const CaptionScreen({super.key, required this.mediaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (r) => r.isFirst);
            },
            child: const Text('Share'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Preview
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: Text(
                'Preview media #$mediaId',
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 16),

            // Caption
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Write a caption...',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
