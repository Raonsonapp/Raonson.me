import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class UserService {
  static Future<Map<String, dynamic>> getProfile(int userId) async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/users/$userId"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
}
