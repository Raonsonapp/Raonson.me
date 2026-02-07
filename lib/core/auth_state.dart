class AuthState {
  static String? token;
  static String? username;

  static bool get isLoggedIn => token != null;
}
