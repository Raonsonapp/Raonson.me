import 'api_service.dart';

class AuthService {
  static Future<dynamic> login(String username, String password) {
    return ApiService.post('/auth/login', {
      'username': username,
      'password': password,
    });
  }

  static Future<dynamic> register(String username, String password) {
    return ApiService.post('/auth/register', {
      'username': username,
      'password': password,
    });
  }
}
