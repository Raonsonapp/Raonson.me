import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';

class SearchService {
  static Future<Map<String, dynamic>> search(String q) async {
    final res = await http.get(
      Uri.parse("$baseUrl/search?q=$q"),
    );
    return jsonDecode(res.body);
  }
}
