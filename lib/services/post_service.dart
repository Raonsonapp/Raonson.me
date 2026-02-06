import 'api_service.dart';

class PostService {
  static Future<List<dynamic>> getPosts() async {
    return await ApiService.get('/posts');
  }

  static Future<dynamic> likePost(int postId) {
    return ApiService.post('/posts/$postId/like', {});
  }
}
