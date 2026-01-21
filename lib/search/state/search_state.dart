import '../models/search_item.dart';
import '../models/category.dart';

class SearchState {
  ContentCategory? selectedCategory;
  List<SearchItem> results = [];

  void setCategory(ContentCategory? c) {
    selectedCategory = c;
  }

  void setResults(List<SearchItem> r) {
    results = r;
  }
}