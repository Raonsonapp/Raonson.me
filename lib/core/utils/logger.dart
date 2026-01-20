import '../config/app_config.dart';

class Logger {
  static void log(String message) {
    if (AppConfig.enableLogs) {
      // ignore: avoid_print
      print('[Raonson] $message');
    }
  }
}
