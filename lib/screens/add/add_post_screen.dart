import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  XFile? file;
  final caption = TextEditingController();
  bool isVideo = false;

  Future<void> pick(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      imageQuality: 90,
    );
    if (picked != null) {
      setState(() {
        file = picked;
        isVideo = false;
      });
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(source: source);
    if (picked != null) {
      setState(() {
        file = picked;
        isVideo = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text('New post'),
        actions: [
          TextButton(
            onPressed: file == null ? null : () {
              // Қадами баъдӣ: upload ба сервер
              Navigator.pop(context);
            },
            child: const Text('Share'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Preview
          Container(
            height: 280,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.25),
                  blurRadius: 22,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: file == null
                  ? const Icon(Icons.add_a_photo,
                      size: 80, color: Colors.white24)
                  : Icon(
                      isVideo ? Icons.play_circle : Icons.image,
                      size: 80,
                      color: Colors.white70,
                    ),
            ),
          ),

          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: caption,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Write a caption...',
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _btn(Icons.image, 'Photo from gallery',
                    () => pick(ImageSource.gallery)),
                _btn(Icons.camera_alt, 'Take photo',
                    () => pick(ImageSource.camera)),
                _btn(Icons.videocam, 'Video from gallery',
                    () => pickVideo(ImageSource.gallery)),
                _btn(Icons.videocam_outlined, 'Record video',
                    () => pickVideo(ImageSource.camera)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(text),
      onTap: onTap,
    );
  }
}
