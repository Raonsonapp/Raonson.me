import '../../core/core.dart';

class TokenStorage {
  static String? _token;

  static Future<void> save(String token) async {
    _token = token;
  }

  static String? get token => _token;

  static Future<void> clear() async {
    _token = null;
  }
}