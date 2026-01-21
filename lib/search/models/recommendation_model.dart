import 'search_item.dart';

class RecommendationModel {
  final String title;
  final List<SearchItem> items;

  RecommendationModel({
    required this.title,
    required this.items,
  });
}