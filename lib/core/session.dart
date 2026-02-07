import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const _keyUsername = 'username';
  static const _keyLoggedIn = 'logged_in';

  /// save session after login/register
  static Future<void> saveUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
    await prefs.setBool(_keyLoggedIn, true);
  }

  /// check if user already logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  /// get current username
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  /// logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
