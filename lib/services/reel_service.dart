import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class ReelService {
  static Future<List<dynamic>> getReels() async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/reels"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load reels");
    }
  }
}
