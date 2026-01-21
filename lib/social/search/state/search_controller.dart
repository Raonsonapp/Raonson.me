import 'package:flutter/material.dart';
import '../../feed/core/feed_post.dart';
import '../core/search_category.dart';
import '../services/search_service.dart';

class SearchController extends ChangeNotifier {
  final SearchService _service = SearchService();

  SearchCategory category = SearchCategory.games;
  List<FeedPost> results = [];
  bool loading = false;

  void setCategory(SearchCategory c) {
    category = c;
    notifyListeners();
  }

  Future<void> search(String query) async {
    loading = true;
    notifyListeners();

    results = await _service.search(query: query, category: category);
    loading = false;
    notifyListeners();
  }
}
