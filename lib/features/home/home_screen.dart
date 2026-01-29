import 'package:flutter/material.dart';
import 'widgets/stories_bar.dart';
import 'widgets/post_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.send),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: const [
          StoriesBar(),
          Divider(color: Colors.grey),
          PostItem(),
          PostItem(),
          PostItem(),
        ],
      ),
    );
  }
}
