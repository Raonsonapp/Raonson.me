import 'core/user_role.dart';
import 'services/permission_checker.dart';
import 'services/premium_guard.dart';

class AccessEngine {
  AccessEngine._();
  static final instance = AccessEngine._();

  bool canUseNextToon(UserRole role, bool isPremium) {
    if (role == UserRole.admin) return true;
    return PremiumGuard().allow(isPremium);
  }

  bool canUseKingAI(UserRole role) {
    return role != UserRole.blocked;
  }

  bool canRenderLongAnime(UserRole role) {
    return role == UserRole.admin || role == UserRole.creator;
  }
}