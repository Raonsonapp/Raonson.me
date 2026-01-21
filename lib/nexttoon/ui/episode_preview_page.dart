import 'package:flutter/material.dart';

class EpisodePreviewPage extends StatelessWidget {
  const EpisodePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episode Preview')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Icon(Icons.play_circle, size: 80, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Export'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Share'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}