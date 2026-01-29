import 'package:flutter/material.dart';

class UserPostsGrid extends StatelessWidget {
  const UserPostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 21,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (_, index) {
        return Image.network(
          'https://picsum.photos/300?random=$index',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
