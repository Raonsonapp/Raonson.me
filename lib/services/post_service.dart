import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class PostService {
  static Future<List<dynamic>> getPosts() async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/posts"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
