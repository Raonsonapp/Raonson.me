import '../core/api.dart';
import '../core/http_service.dart';
import '../core/session.dart';

class AuthService {
  // ===== REGISTER =====
  static Future<void> register({
    required String username,
    required String password,
  }) async {
    final res = await HttpService.post(
      Api.register,
      {
        'username': username,
        'password': password,
      },
    );

    // агар сервер message баргардонад — OK
    if (res == null || res['username'] != username) {
      throw Exception('Registration failed');
    }

    await Session.save(username);
  }

  // ===== LOGIN =====
  static Future<void> login({
    required String username,
    required String password,
  }) async {
    final res = await HttpService.post(
      Api.login,
      {
        'username': username,
        'password': password,
      },
    );

    // сервер token намедиҳад — username мегирем
    if (res == null || !res.containsKey('token')) {
      throw Exception('Login failed');
    }

    await Session.save(username);
  }
}
