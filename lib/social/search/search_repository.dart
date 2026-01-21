import 'search_query.dart';
import 'search_result_model.dart';

class SearchRepository {
  Future<List<SearchResult>> search(SearchQuery query) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return List.generate(12, (i) {
      return SearchResult(
        id: "search-${query.keyword}-$i",
        title: "${query.keyword} result $i",
        previewUrl: "local://preview_$i.jpg",
        category: query.category,
      );
    });
  }
}