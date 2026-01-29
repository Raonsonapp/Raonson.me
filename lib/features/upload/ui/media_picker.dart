import 'package:flutter/material.dart';

class MediaPicker extends StatelessWidget {
  const MediaPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Preview area
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.black12,
            child: const Center(
              child: Icon(Icons.photo, size: 80),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Fake gallery grid (UI only)
        Expanded(
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (_, i) {
              return Image.network(
                'https://picsum.photos/300?random=$i',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    );
  }
}
