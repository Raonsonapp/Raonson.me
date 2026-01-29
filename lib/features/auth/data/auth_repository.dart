import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/services/firebase_service.dart';

class AuthRepository {
  /// 🔐 Login with email & password
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseService.auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  /// 🚪 Logout
  Future<void> logout() async {
    await FirebaseService.auth.signOut();
  }

  /// ❌ Error mapping (clear messages)
  Exception _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return Exception('User not found');
      case 'wrong-password':
        return Exception('Wrong password');
      case 'invalid-email':
        return Exception('Invalid email');
      case 'user-disabled':
        return Exception('User disabled');
      default:
        return Exception(e.message ?? 'Auth error');
    }
  }
}
