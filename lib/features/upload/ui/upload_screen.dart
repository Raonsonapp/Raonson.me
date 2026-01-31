import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String caption = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Published!")),
              );
            },
            child: const Text(
              "Publish",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: Column(
        children: [

          /// Image Preview
          Container(
            height: 250,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.image, size: 80),
            ),
          ),

          const SizedBox(height: 10),

          /// Pick Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            label: const Text("Choose Image"),
          ),

          const SizedBox(height: 20),

          /// Caption
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              maxLines: 3,
              onChanged: (v) => caption = v,
              decoration: const InputDecoration(
                hintText: "Write a caption...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
