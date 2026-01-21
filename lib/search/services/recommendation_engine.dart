import '../models/search_item.dart';

class RecommendationEngine {
  List<SearchItem> recommend(List<SearchItem> all) {
    all.sort((a, b) => b.views.compareTo(a.views));
    return all.take(10).toList();
  }
}