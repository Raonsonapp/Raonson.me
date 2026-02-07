import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _image = TextEditingController();
  final _caption = TextEditingController();
  bool loading = false;

  Future<void> submit() async {
    setState(() => loading = true);
    await PostService.createPost(
      imageUrl: _image.text,
      caption: _caption.text,
    );
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _image,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _caption,
              decoration: const InputDecoration(
                labelText: 'Caption',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loading ? null : submit,
              child: const Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }
}
