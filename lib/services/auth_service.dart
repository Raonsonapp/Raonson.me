import 'dart:convert';
import '../core/http_service.dart';
import '../core/session.dart';

class AuthService {
  static Future<void> login(
    String username,
    String password,
  ) async {
    final res = await HttpService.post(
      '/auth/login',
      {
        'username': username,
        'password': password,
      },
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      await Session.save(
        token: data['token'],
        username: username,
      );
    } else {
      throw Exception('Login failed');
    }
  }

  static Future<void> register(
    String username,
    String password,
  ) async {
    final res = await HttpService.post(
      '/auth/register',
      {
        'username': username,
        'password': password,
      },
    );

    if (res.statusCode != 200) {
      throw Exception('Register failed');
    }
  }
}
