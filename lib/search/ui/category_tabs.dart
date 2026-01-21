import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryTabs extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryTabs({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map(
              (c) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Chip(label: Text('${c.icon} ${c.name}')),
              ),
            )
            .toList(),
      ),
    );
  }
}