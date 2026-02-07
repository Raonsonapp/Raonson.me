import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = 'https://raonson-me.onrender.com';

  static Future<http.Response> get(String path) async {
    return await http.get(
      Uri.parse('$baseUrl$path'),
      headers: _headers(),
    );
  }

  static Future<http.Response> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    return await http.post(
      Uri.parse('$baseUrl$path'),
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
      };
}
