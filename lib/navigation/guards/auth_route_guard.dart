import '../../auth/services/token_storage.dart';

class AuthRouteGuard {
  static bool canAccess() {
    return TokenStorage.token != null;
  }
}
