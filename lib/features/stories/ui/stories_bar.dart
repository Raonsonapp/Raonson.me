import 'package:flutter/material.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.orange],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const Text("user", style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
