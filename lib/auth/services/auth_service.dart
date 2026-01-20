import '../models/user_model.dart';
import '../models/session_model.dart';

class AuthService {
  Future<SessionModel> login(String email, String password) async {
    // API real later
    return SessionModel(
      token: 'mock_token',
      expiresAt: DateTime.now().add(const Duration(days: 7)),
    );
  }

  Future<UserModel> register(
    String email,
    String username,
    String password,
  ) async {
    return UserModel(
      id: 'uid_1',
      email: email,
      username: username,
      isVerified: false,
      isPremium: false,
    );
  }

  Future<void> logout() async {}
}
