import 'category.dart';

class SearchItem {
  final String id;
  final String title;
  final ContentCategory category;
  final int views;

  SearchItem({
    required this.id,
    required this.title,
    required this.category,
    required this.views,
  });
}