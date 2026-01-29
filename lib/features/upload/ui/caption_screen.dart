import 'dart:io';
import 'package:flutter/material.dart';

class CaptionScreen extends StatelessWidget {
  final File file;

  const CaptionScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: upload to backend / firebase
              Navigator.pop(context);
            },
            child: const Text('Share'),
          )
        ],
      ),
      body: Column(
        children: [
          Image.file(file, height: 260, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Write a caption...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
