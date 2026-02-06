import 'api_service.dart';

class PostService {
  static Future<List<dynamic>> getPosts() async {
    return await ApiService.get('/posts');
  }

  static Future<dynamic> createPost(String caption, String imageUrl) {
    return ApiService.post('/posts', {
      'caption': caption,
      'image_url': imageUrl,
    });
  }
}
