import 'package:flutter/material.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        ListTile(title: Text('Newest')),
        ListTile(title: Text('Most viewed')),
        ListTile(title: Text('Trending')),
      ],
    );
  }
}