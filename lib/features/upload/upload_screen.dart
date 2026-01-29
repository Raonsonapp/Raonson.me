import 'package:flutter/material.dart';
import 'upload_type_selector.dart';
import 'upload_preview.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String selectedType = 'Post';
  final captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Upload logic (баъд)
            },
            child: const Text(
              'Share',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          UploadPreview(type: selectedType),
          const SizedBox(height: 12),
          UploadTypeSelector(
            selected: selectedType,
            onSelect: (value) {
              setState(() => selectedType = value);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: captionController,
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
