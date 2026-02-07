import 'dart:convert';
import '../core/http_service.dart';

class UploadService {
  static Future<void> createPost({
    required String caption,
  }) async {
    final res = await HttpService.post(
      '/posts',
      {
        'caption': caption,
      },
    );

    if (res.statusCode != 200 && res.statusCode != 201) {
      throw Exception('Create post failed');
    }
  }
}
