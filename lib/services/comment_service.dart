import 'api_service.dart';

class CommentService {
  static Future<List<dynamic>> getComments(int postId) async {
    return await ApiService.get('/posts/$postId/comments');
  }

  static Future<dynamic> addComment(int postId, String text) async {
    return await ApiService.post(
      '/posts/$postId/comments',
      {'text': text},
    );
  }
}
