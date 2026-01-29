import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  int selectedTab = 0;

  final tabs = ['Post', 'Reel', 'Story'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Share',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _mediaPreview(),
          _tabs(),
          _caption(),
          _options(),
        ],
      ),
    );
  }

  // 🖼 Media Preview
  Widget _mediaPreview() {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.black12,
      child: const Center(
        child: Icon(
          Icons.image,
          size: 80,
          color: Colors.black38,
        ),
      ),
    );
  }

  // 🔘 Post / Reel / Story Tabs
  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabs.length, (index) {
          final isActive = selectedTab == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: Column(
              children: [
                Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                if (isActive)
                  Container(
                    height: 2,
                    width: 40,
                    color: Colors.black,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ✏️ Caption
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

  // ⚙️ Options
  Widget _options() {
    return Column(
      children: const [
        ListTile(
          leading: Icon(Icons.person_add_alt),
          title: Text('Tag people'),
        ),
        ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Add location'),
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text('Add music'),
        ),
      ],
    );
  }
}
