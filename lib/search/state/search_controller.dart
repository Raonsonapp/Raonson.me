import 'package:flutter/material.dart';
import '../services/search_service.dart';
import 'search_state.dart';

class SearchController extends ChangeNotifier {
  final SearchService _service = SearchService();
  SearchState state = SearchState();

  Future<void> search(String query) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    final results = await _service.search(query);

    state = state.copyWith(
      loading: false,
      results: results,
    );
    notifyListeners();
  }
}