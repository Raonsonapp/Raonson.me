import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String _keyUser = 'user';

  /// Save username after login/register
  static Future<void> save(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUser, username);
  }

  /// Get current logged-in username
  static Future<String?> username() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUser);
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyUser);
  }

  /// Logout user
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
  }
}
