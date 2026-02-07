import 'package:flutter/material.dart';
import '../../services/post_service.dart';
import '../../core/session.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _imageCtrl = TextEditingController();
  final _captionCtrl = TextEditingController();
  bool _loading = false;

  Future<void> _submit() async {
    final image = _imageCtrl.text.trim();
    final caption = _captionCtrl.text.trim();

    if (image.isEmpty) return;

    setState(() => _loading = true);

    try {
      final username = await Session.username() ?? '';
      await PostService.create(
        username: username,
        imageUrl: image,
        caption: caption,
      );
      if (mounted) Navigator.pop(context, true);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to create post')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _imageCtrl,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _captionCtrl,
              decoration: const InputDecoration(
                labelText: 'Caption',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _submit,
                child: _loading
                    ? const CircularProgressIndicator()
                    : const Text('Publish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
