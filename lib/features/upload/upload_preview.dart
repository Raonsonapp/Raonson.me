import 'package:flutter/material.dart';

class UploadPreview extends StatelessWidget {
  final String type;

  const UploadPreview({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'Story'
                  ? Icons.history
                  : type == 'Reel'
                      ? Icons.video_collection
                      : Icons.image,
              size: 80,
            ),
            const SizedBox(height: 12),
            Text(
              'Preview $type',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
