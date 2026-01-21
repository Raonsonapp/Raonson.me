import '../models/search_item.dart';
import '../models/category.dart';

class SearchEngine {
  static final List<SearchItem> _db = [
    SearchItem(id: '1', title: 'Anime Battle', category: ContentCategory.anime, views: 50000),
    SearchItem(id: '2', title: 'Football Skills', category: ContentCategory.sports, views: 32000),
    SearchItem(id: '3', title: 'Gaming Stream', category: ContentCategory.game, views: 88000),
  ];

  List<SearchItem> search(String query, ContentCategory? category) {
    return _db.where((item) {
      final q = item.title.toLowerCase().contains(query.toLowerCase());
      final c = category == null || item.category == category;
      return q && c;
    }).toList();
  }
}