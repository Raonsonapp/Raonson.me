import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/api_config.dart';

class ApiService {
  static Future<dynamic> get(String path) async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}$path'),
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> post(String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return jsonDecode(response.body);
  }
}
