import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const _key = 'logged_in';

  static Future<void> login() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_key, true);
  }

  static Future<bool> isLoggedIn() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool(_key) ?? false;
  }

  static Future<void> logout() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(_key);
  }
}
