import '../core/api.dart';
import '../core/http_service.dart';

class AuthService {
  static Future<bool> login(String username, String password) async {
    final res = await HttpService.post(
      '${Api.baseUrl}/auth/login',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  static Future<bool> register(String username, String password) async {
    final res = await HttpService.post(
      '${Api.baseUrl}/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }
}
