import '../models/category_model.dart';

class CategoryService {
  List<CategoryModel> getCategories() {
    return [
      CategoryModel(name: 'Anime', icon: '🔥'),
      CategoryModel(name: 'Games', icon: '🎮'),
      CategoryModel(name: 'Music', icon: '🎵'),
      CategoryModel(name: 'Movies', icon: '🎬'),
      CategoryModel(name: 'Live', icon: '📡'),
    ];
  }
}
