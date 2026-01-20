import '../services/token_storage.dart';

class AuthGuard {
  static bool canAccess() {
    return TokenStorage.token != null;
  }
}
