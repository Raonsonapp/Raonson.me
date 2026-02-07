import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<void> save(String user) async {
    final p = await SharedPreferences.getInstance();
    await p.setString('user', user);
  }

  static Future<String?> username() async {
    final p = await SharedPreferences.getInstance();
    return p.getString('user');
  }

  static Future<void> logout() async {
    final p = await SharedPreferences.getInstance();
    await p.clear();
  }
}
