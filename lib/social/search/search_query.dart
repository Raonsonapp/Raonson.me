import '../feed/feed_category.dart';

class SearchQuery {
  final String keyword;
  final FeedCategory category;

  SearchQuery({
    required this.keyword,
    required this.category,
  });
}