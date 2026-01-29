import 'package:flutter/material.dart';

class UserPostsGrid extends StatelessWidget {
  const UserPostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: 18,
      itemBuilder: (context, index) {
        return Image.network(
          'https://picsum.photos/300?random=$index',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
