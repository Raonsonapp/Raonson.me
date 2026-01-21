import '../feed/feed_category.dart';

class SearchResult {
  final String id;
  final String title;
  final String previewUrl;
  final FeedCategory category;

  SearchResult({
    required this.id,
    required this.title,
    required this.previewUrl,
    required this.category,
  });
}