import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.white54),
              SizedBox(width: 8),
              Text(
                'Search',
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white10,
            child: const Center(
              child: Icon(
                Icons.image,
                color: Colors.white24,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }
}
