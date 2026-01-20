import 'auth_state.dart';
import '../services/auth_service.dart';
import '../services/token_storage.dart';

class AuthController {
  final AuthService _service = AuthService();
  AuthState state = AuthState();

  Future<void> login(String email, String password) async {
    state = AuthState(loading: true);
    final session = await _service.login(email, password);
    await TokenStorage.save(session.token);
    state = AuthState(loading: false);
  }

  Future<void> logout() async {
    await TokenStorage.clear();
    state = AuthState();
  }
}
