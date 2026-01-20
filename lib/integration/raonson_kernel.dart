import '../engine/access/access_engine.dart';
import '../engine/scene/scene_engine.dart';
import '../engine/render/video_render_engine.dart';
import '../engine/voice/voice_engine.dart';
import '../engine/style/style_engine.dart';

class RaonsonKernel {
  RaonsonKernel._();
  static final instance = RaonsonKernel._();

  final access = AccessEngine.instance;
  final scene = SceneEngine.instance;
  final voice = VoiceEngine.instance;
  final style = StyleEngine.instance;
  final render = VideoRenderEngine.instance;

  Future<bool> canCreateAnime({
    required bool isPremium,
    required String role,
  }) async {
    return access.canUseNextToon(
      _mapRole(role),
      isPremium,
    );
  }

  UserRole _mapRole(String role) {
    switch (role) {
      case 'admin':
        return UserRole.admin;
      case 'creator':
        return UserRole.creator;
      case 'premium':
        return UserRole.premium;
      default:
        return UserRole.user;
    }
  }
}