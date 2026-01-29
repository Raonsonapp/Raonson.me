import 'package:flutter/material.dart';
import 'caption_screen.dart';

class MediaPickerScreen extends StatelessWidget {
  const MediaPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select media'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CaptionScreen(
                    mediaId: index,
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.image),
            ),
          );
        },
      ),
    );
  }
}
