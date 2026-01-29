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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _preview(),
          _controls(),
          _switchType(),
          _caption(),
        ],
      ),
    );
  }

  // 🔲 Preview (image / video placeholder)
  Widget _preview() {
    return Container(
      height: isReel ? 420 : 300,
      width: double.infinity,
      color: Colors.black12,
      child: const Center(
        child: Icon(Icons.play_arrow, size: 64),
      ),
    );
  }

  // 🎛 Gallery / Music / Effects
  Widget _controls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _controlItem(Icons.photo_library, 'Gallery'),
          _controlItem(Icons.music_note, 'Music'),
          _controlItem(Icons.auto_awesome, 'Effects'),
          _controlItem(Icons.crop, 'Crop'),
        ],
      ),
    );
  }

  Widget _controlItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // 🔁 Post / Reel switch
  Widget _switchType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip(
            label: const Text('Post'),
            selected: !isReel,
            onSelected: (_) => setState(() => isReel = false),
          ),
          const SizedBox(width: 12),
          ChoiceChip(
            label: const Text('Reel'),
            selected: isReel,
            onSelected: (_) => setState(() => isReel = true),
          ),
        ],
      ),
    );
  }

  // ✍ Caption
  Widget _caption() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        maxLines: 2,
        decoration: const InputDecoration(
          hintText: 'Write a caption...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
