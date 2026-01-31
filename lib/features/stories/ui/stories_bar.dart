import 'package:flutter/material.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.pink, Colors.orange],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150",
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text("User$index",
                    style: const TextStyle(fontSize: 12))
              ],
            ),
          );
        },
      ),
    );
  }
}
