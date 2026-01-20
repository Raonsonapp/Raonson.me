import '../../engine/access/access_engine.dart';
import '../../engine/access/core/user_role.dart';

class NextToonGuard {
  bool allow(UserRole role, bool premium) {
    return AccessEngine.instance.canUseNextToon(role, premium);
  }
}