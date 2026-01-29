import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthInitial()) {
    _listenAuthChanges();
  }

  void _listenAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthUnauthenticated());
      } else {
        emit(AuthAuthenticated(user));
      }
    });
  }

  /// 🔐 LOGIN
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      final user = await _repository.login(
        email: email,
        password: password,
      );
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// 📝 REGISTER
  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(const AuthLoading());
    try {
      final user = await _repository.register(
        email: email,
        password: password,
        username: username,
      );
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// 🚪 LOGOUT
  Future<void> logout() async {
    emit(const AuthLoading());
    await FirebaseAuth.instance.signOut();
    emit(const AuthUnauthenticated());
  }
}
