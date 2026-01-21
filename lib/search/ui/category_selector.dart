import 'package:flutter/material.dart';
import '../models/category.dart';

class CategorySelector extends StatelessWidget {
  final ContentCategory? selected;
  final Function(ContentCategory?) onSelect;

  const CategorySelector({required this.selected, required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ContentCategory.values.map((c) {
        final isActive = c == selected;
        return ChoiceChip(
          label: Text(c.name.toUpperCase()),
          selected: isActive,
          onSelected: (_) => onSelect(isActive ? null : c),
        );
      }).toList(),
    );
  }
}