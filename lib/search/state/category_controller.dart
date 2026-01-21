import 'search_state.dart';
import '../models/search_category.dart';
import '../services/search_service.dart';

class SearchController {
  final SearchService _service = SearchService();
  SearchState state = SearchState();

  Future<void> search(String query) async {
    state = SearchState(
      query: query,
      category: state.category,
      loading: true,
    );

    final results = await _service.search(query, state.category);

    state = SearchState(
      query: query,
      category: state.category,
      results: results,
      loading: false,
    );
  }

  void changeCategory(SearchCategory category) {
    state = SearchState(
      query: state.query,
      category: category,
    );
  }
}
