import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isReel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Share',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _preview(),
          _switchType(),
          _caption(),
        ],
      ),
    );
  }

  /// 📸 Preview area
  Widget _preview() {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.add_photo_alternate, size: 80),
      ),
    );
  }

  /// 🔁 Post / Reel switch
  Widget _switchType() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip(
            label: const Text('Post'),
            selected: !isReel,
            onSelected: (_) {
              setState(() => isReel = false);
            },
          ),
          const SizedBox(width: 12),
          ChoiceChip(
            label: const Text('Reel'),
            selected: isReel,
            onSelected: (_) {
              setState(() => isReel = true);
            },
          ),
        ],
      ),
    );
  }

  /// ✍️ Caption
  Widget _caption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'Write a caption...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
