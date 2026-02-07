import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../core/session.dart';
import '../models/auth_response.dart';

class AuthService {
  /// REGISTER
  static Future<AuthResponse> register({
    required String username,
    required String password,
  }) async {
    final res = await HttpService.post(
      Api.register,
      body: {
        'username': username,
        'password': password,
      },
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return AuthResponse.fromJson(data);
    } else {
      throw Exception(data['detail'] ?? 'Register failed');
    }
  }

  /// LOGIN
  static Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final res = await HttpService.post(
      Api.login,
      body: {
        'username': username,
        'password': password,
      },
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      final auth = AuthResponse.fromJson(data);

      /// 🔐 SAVE SESSION (ИН ҶО МУҲИМ АСТ)
      await Session.save(
        username: username,
        token: auth.token,
      );

      return auth;
    } else {
      throw Exception(data['detail'] ?? 'Login failed');
    }
  }

  /// LOGOUT
  static Future<void> logout() async {
    await Session.logout();
  }
}
