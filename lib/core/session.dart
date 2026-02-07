import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<void> save(String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user');
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
