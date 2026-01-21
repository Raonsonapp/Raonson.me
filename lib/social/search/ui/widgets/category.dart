import 'package:flutter/material.dart';
import '../../core/search_category.dart';

class CategoryTabs extends StatelessWidget {
  final SearchCategory selected;
  final ValueChanged<SearchCategory> onSelected;

  const CategoryTabs({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: SearchCategory.values.map((c) {
          final active = c == selected;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(c.label),
              selected: active,
              onSelected: (_) => onSelected(c),
            ),
          );
        }).toList(),
      ),
    );
  }
}
