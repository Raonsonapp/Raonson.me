import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config.dart';

class SearchService {
  static Future<List> searchPosts() async {
    final res = await http
        .get(Uri.parse('${AppConfig.baseUrl}/search'))
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Search failed');
  }
}
