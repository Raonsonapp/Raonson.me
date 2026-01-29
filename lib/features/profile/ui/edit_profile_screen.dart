import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Bio'),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
