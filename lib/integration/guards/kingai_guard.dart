import '../../engine/access/access_engine.dart';
import '../../engine/access/core/user_role.dart';

class KingAIGuard {
  bool allow(UserRole role) {
    return AccessEngine.instance.canUseKingAI(role);
  }
}
