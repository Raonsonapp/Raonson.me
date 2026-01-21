import '../models/search_item.dart';

class TrendingEngine {
  List<SearchItem> trending(List<SearchItem> all) {
    return all.where((i) => i.views > 30000).toList();
  }
}