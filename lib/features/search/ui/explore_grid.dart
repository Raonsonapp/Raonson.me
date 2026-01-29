import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // баъд: кушодани пост / видео
          },
          child: Hero(
            tag: 'explore_$index',
            child: Container(
              color: Colors.grey.shade300,
              child: Image.network(
                'https://picsum.photos/id/${index + 30}/300/300',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
