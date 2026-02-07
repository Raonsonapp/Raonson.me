import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String _keyUser = 'raonson_user';

  // SAVE USER
  static Future<void> save(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUser, username);
  }

  // GET USER
  static Future<String?> username() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUser);
  }

  // CHECK LOGIN
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyUser);
  }

  // LOGOUT
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
  }
}
