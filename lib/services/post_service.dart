import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../models/post_model.dart';

class PostService {
  static Future<List<PostModel>> fetchPosts() async {
    final res = await HttpService.get('${Api.baseUrl}/posts');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List;
      return data.map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }
}
