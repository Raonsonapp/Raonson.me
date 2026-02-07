import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_state.dart';

const baseUrl = "https://raonson-me.onrender.com";

Future<bool> login(String u, String p) async {
  final res = await http.post(
    Uri.parse("$baseUrl/auth/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": u, "password": p}),
  );

  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    AuthState.token = data["token"];
    AuthState.username = data["user"]["username"];
    return true;
  }
  return false;
}
