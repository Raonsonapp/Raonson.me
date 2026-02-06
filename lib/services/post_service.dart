import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';
import 'auth_service.dart';

class PostService {
  static Future<List> getFeed() async {
    final res = await http.get(
      Uri.parse("$baseUrl/posts/feed"),
    );
    return jsonDecode(res.body);
  }

  static Future<void> createPost(String imageUrl, String caption) async {
    await http.post(
      Uri.parse("$baseUrl/posts/"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": AuthService.token!,
      },
      body: jsonEncode({
        "image_url": imageUrl,
        "caption": caption,
      }),
    );
  }
}
