import 'package:flutter/material.dart';
import 'media_picker.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Next'),
          )
        ],
      ),
      body: const MediaPicker(),
    );
  }
}
