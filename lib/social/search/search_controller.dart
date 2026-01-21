import 'search_repository.dart';
import 'search_query.dart';
import 'search_result_model.dart';
import '../feed/feed_category.dart';

class SearchController {
  final SearchRepository _repo = SearchRepository();

  List<SearchResult> results = [];
  bool loading = false;

  Future<void> execute(String keyword, FeedCategory category) async {
    loading = true;
    results = await _repo.search(
      SearchQuery(keyword: keyword, category: category),
    );
    loading = false;
  }
}