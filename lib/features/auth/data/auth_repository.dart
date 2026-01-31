class AuthRepository {
  Future<bool> login(String email, String pass) async {
    await Future.delayed(const Duration(seconds: 1));
    return email.isNotEmpty && pass.isNotEmpty;
  }

  Future<bool> register(String email, String pass) async {
    await Future.delayed(const Duration(seconds: 1));
    return email.isNotEmpty && pass.length > 5;
  }
}
