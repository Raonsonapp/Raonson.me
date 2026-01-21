import '../../engine/access/access_engine.dart';
import '../../engine/access/core/user_role.dart';

class LiveAccessService {
  bool canStartLive(UserRole role, bool premium) {
    if (role == UserRole.admin) return true;
    if (role == UserRole.creator && premium) return true;
    return false;
  }
}
