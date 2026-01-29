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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';

extension RegisterExtension on AuthRepository {
  /// 📝 Register new user
  Future<User?> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final credential =
          await FirebaseService.auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;
      if (user == null) return null;

      final userModel = UserModel(
        uid: user.uid,
        email: email,
        username: username,
      );

      await FirebaseService.firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toMap());

      return user;
    } on FirebaseAuthException catch (e) {
      throw _mapRegisterError(e);
    }
  }

  Exception _mapRegisterError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return Exception('Email already in use');
      case 'weak-password':
        return Exception('Weak password');
      case 'invalid-email':
        return Exception('Invalid email');
      default:
        return Exception(e.message ?? 'Register error');
    }
  }
}
