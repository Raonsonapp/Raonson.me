import 'api.dart';
import 'http_client.dart';

class AuthService {
  static Future<void> login(String u, String p) async {
    await HttpClient.post(
      '${ApiConfig.baseUrl}/auth/login',
      {'username': u, 'password': p},
    );
  }

  static Future<void> register(String u, String p) async {
    await HttpClient.post(
      '${ApiConfig.baseUrl}/auth/register',
      {'username': u, 'password': p},
    );
  }
}
