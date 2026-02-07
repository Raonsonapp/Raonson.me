import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<dynamic> get(String url) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('GET failed');
  }

  static Future<dynamic> post(String url, Map body) async {
    final res = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('POST failed');
  }
}
