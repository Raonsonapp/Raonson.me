import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          StoriesBar(),
          Divider(color: Colors.white12),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }
}
