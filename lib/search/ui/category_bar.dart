import 'package:flutter/material.dart';
import '../models/search_category.dart';

class CategoryBar extends StatelessWidget {
  final SearchCategory selected;
  final ValueChanged<SearchCategory> onChanged;

  const CategoryBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: SearchCategory.values.map((c) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(c.name),
              selected: c == selected,
              onSelected: (_) => onChanged(c),
            ),
          );
        }).toList(),
      ),
    );
  }
}
