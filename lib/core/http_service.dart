import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = 'https://raonson-me.onrender.com';

  static Future<http.Response> get(String path) async {
    final url = Uri.parse('$baseUrl$path');
    return await http.get(url, headers: _headers());
  }

  static Future<http.Response> post(String path, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$path');
    return await http.post(
      url,
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
    };
  }
}
