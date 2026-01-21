import 'package:flutter/material.dart';
import '../models/recommendation_model.dart';

class RecommendationSection extends StatelessWidget {
  final RecommendationModel model;

  const RecommendationSection({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.items.length,
            itemBuilder: (_, i) {
              final item = model.items[i];
              return SizedBox(
                width: 140,
                child: Image.network(item.thumbnail),
              );
            },
          ),
        ),
      ],
    );
  }
}