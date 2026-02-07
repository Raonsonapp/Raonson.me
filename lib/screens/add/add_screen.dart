import 'package:flutter/material.dart';

/// ===============================
/// ADD POST SCREEN – RAONSON v2
/// Create / Preview / Publish
/// ===============================

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _captionController = TextEditingController();

  bool hasMedia = false;
  bool publishing = false;

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  // -------------------------------
  // BUILD
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: SafeArea(
        child: hasMedia ? _editor() : _picker(),
      ),
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
  // MEDIA PICKER
  // -------------------------------
  Widget _picker() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pickerButton(
            icon: Icons.photo_library,
            label: 'Gallery',
            onTap: () {
              setState(() {
                hasMedia = true; // mock select
              });
            },
          ),
          const SizedBox(height: 20),
          _pickerButton(
            icon: Icons.camera_alt,
            label: 'Camera',
            onTap: () {
              setState(() {
                hasMedia = true; // mock capture
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _pickerButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
  // EDITOR (PREVIEW + CAPTION)
  // -------------------------------
  Widget _editor() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _preview(),
        const SizedBox(height: 16),
        _captionField(),
        const SizedBox(height: 16),
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
      controller: _captionController,
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

  // -------------------------------
  // OPTIONS
  // -------------------------------
  Widget _options() {
    return Column(
      children: [
        _optionTile(Icons.tag, 'Tag people'),
        _optionTile(Icons.location_on, 'Add location'),
        _optionTile(Icons.music_note, 'Add music'),
      ],
    );
  }

  Widget _optionTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  // -------------------------------
  // PUBLISH
  // -------------------------------
  Future<void> _publish() async {
    setState(() => publishing = true);

    // TODO: upload to server
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => publishing = false);
    Navigator.pop(context);
  }
}
