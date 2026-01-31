import 'package:flutter/material.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';

class AuthController extends ChangeNotifier {
  final repo = AuthRepository();
  AuthState state = AuthState();

  Future<void> login(String email, String pass) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    bool ok = await repo.login(email, pass);

    state = ok
        ? state.copyWith(success: true, loading: false)
        : state.copyWith(error: "Login error", loading: false);

    notifyListeners();
  }

  Future<void> register(String email, String pass) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    bool ok = await repo.register(email, pass);

    state = ok
        ? state.copyWith(success: true, loading: false)
        : state.copyWith(error: "Register error", loading: false);

    notifyListeners();
  }
}
