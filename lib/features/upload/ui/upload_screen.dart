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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MediaPickerScreen(),
                ),
              );
            },
            child: const Text('Next'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_box_outlined, size: 80),
            SizedBox(height: 16),
            Text(
              'Create a new post',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
