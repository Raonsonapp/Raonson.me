import '../models/search_item.dart';
import '../models/search_category.dart';

class SearchService {
  Future<List<SearchItem>> search(
    String query,
    SearchCategory category,
  ) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return List.generate(
      10,
      (i) => SearchItem(
        id: '$i',
        title: '$query result $i',
        category: category,
      ),
    );
  }
}