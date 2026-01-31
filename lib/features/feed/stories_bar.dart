import 'package:flutter/material.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const CircleAvatar(radius: 28),
              const SizedBox(height: 4),
              Text('User $i', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
