import 'package:flutter/material.dart';

class UserPostsGrid extends StatelessWidget {
  const UserPostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 24,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (_, i) {
        return Image.network(
          'https://picsum.photos/300?random=$i',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
