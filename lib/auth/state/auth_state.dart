import '../models/user_model.dart';

class AuthState {
  final UserModel? user;
  final bool loading;

  AuthState({
    this.user,
    this.loading = false,
  });

  bool get isLoggedIn => user != null;
}