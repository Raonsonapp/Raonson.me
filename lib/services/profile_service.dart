import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';
import 'auth_service.dart';

class ProfileService {
  static Future<Map<String, dynamic>> myProfile() async {
    final res = await http.get(
      Uri.parse("$baseUrl/profile/me"),
      headers: {"Authorization": AuthService.token!},
    );
    return jsonDecode(res.body);
  }
}
