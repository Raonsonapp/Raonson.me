import '../core/user_role.dart';

class AdminService {
  UserRole assignRole(String userId, UserRole role) {
    // later: Firebase / backend
    return role;
  }

  bool banUser(String userId) {
    return true;
  }
}
