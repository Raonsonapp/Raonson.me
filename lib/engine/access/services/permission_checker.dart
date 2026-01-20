import '../core/user_role.dart';
import '../core/permission.dart';

class PermissionChecker {
  bool has(UserRole role, Permission permission) {
    if (role == UserRole.admin) return true;

    switch (permission) {
      case Permission.useNextToon:
        return role == UserRole.premium || role == UserRole.creator;
      case Permission.renderLong:
        return role == UserRole.creator;
      default:
        return true;
    }
  }
}