import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class SearchService {
  static Future<Map<String, dynamic>> search(String query) async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/search?q=$query"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Search failed");
    }
  }
}
