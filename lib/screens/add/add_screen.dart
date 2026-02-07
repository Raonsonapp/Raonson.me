import 'package:flutter/material.dart';
import '../../services/upload_service.dart';

/// =======================================
/// ADD POST SCREEN – RAONSON v2 (REAL)
/// =======================================

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _caption = TextEditingController();

  bool hasMedia = false;
  bool publishing = false;
  String? error;

  @override
  void dispose() {
    _caption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: hasMedia ? _editor() : _picker(),
    );
  }

  // -------------------------------
  // APP BAR
  // -------------------------------
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'New post',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        if (hasMedia)
          TextButton(
            onPressed: publishing ? null : _publish,
            child: publishing
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
      ],
    );
  }

  // -------------------------------
  // PICKER (MOCK MEDIA)
  // -------------------------------
  Widget _picker() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pickerBtn(Icons.photo_library, 'Gallery'),
          const SizedBox(height: 16),
          _pickerBtn(Icons.camera_alt, 'Camera'),
        ],
      ),
    );
  }

  Widget _pickerBtn(IconData icon, String label) {
    return GestureDetector(
      onTap: () => setState(() => hasMedia = true),
      child: Container(
        width: 220,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.8),
              Colors.cyanAccent.withOpacity(0.6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              blurRadius: 14,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------
  // EDITOR
  // -------------------------------
  Widget _editor() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _preview(),
        const SizedBox(height: 16),
        _captionField(),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              error!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 20),
        _options(),
      ],
    );
  }

  Widget _preview() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2333),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          size: 90,
          color: Colors.white24,
        ),
      ),
    );
  }

  Widget _captionField() {
    return TextField(
      controller: _caption,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Write a caption...',
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _options() {
    return Column(
      children: [
        _option(Icons.tag, 'Tag people'),
        _option(Icons.location_on, 'Add location'),
        _option(Icons.music_note, 'Add music'),
      ],
    );
  }

  Widget _option(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  // -------------------------------
  // PUBLISH (REAL)
  // -------------------------------
  Future<void> _publish() async {
    if (_caption.text.trim().isEmpty) {
      setState(() => error = 'Caption required');
      return;
    }

    setState(() {
      publishing = true;
      error = null;
    });

    try {
      await UploadService.createPost(
        caption: _caption.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context, true); // 👈 бармегардем ба Home
    } catch (e) {
      setState(() => error = 'Upload failed');
    }

    setState(() => publishing = false);
  }
}
