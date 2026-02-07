import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String _keyUsername = 'username';

  // ===== SAVE =====
  static Future<void> save(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  // ===== GET USERNAME =====
  static Future<String?> username() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  // ===== CHECK LOGIN =====
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyUsername);
  }

  // ===== LOGOUT =====
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
  }
}
