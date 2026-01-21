/// ProjectSplitter
/// Шикастани лоиҳа ба папкаҳо ва файлҳо
class ProjectSplitter {
  final String projectId;

  ProjectSplitter(this.projectId);

  /// Структураи асосии Flutter app
  Map<String, List<String>> generateFlutterStructure() {
    return {
      'lib/core': [
        'app.dart',
        'app_config.dart',
        'constants.dart',
        'logger.dart',
      ],
      'lib/auth': [
        'auth_controller.dart',
        'auth_service.dart',
        'login_screen.dart',
        'register_screen.dart',
      ],
      'lib/navigation': [
        'app_router.dart',
        'routes.dart',
      ],
      'lib/ui': [
        'home_screen.dart',
        'profile_screen.dart',
        'settings_screen.dart',
      ],
      'lib/media/reels': [
        'reels_controller.dart',
        'reels_service.dart',
        'reels_screen.dart',
      ],
      'lib/media/video': [
        'video_player_controller.dart',
        'video_quality_selector.dart',
        'video_download.dart',
      ],
      'lib/chat/gpt': [
        'chatgpt_controller.dart',
        'chatgpt_service.dart',
        'chatgpt_screen.dart',
      ],
      'lib/chat/king_ai': [
        'king_ai_controller.dart',
        'king_ai_service.dart',
        'king_ai_screen.dart',
      ],
      'lib/nexttoon': [
        'nexttoon_controller.dart',
        'episode_generator.dart',
        'scene_planner.dart',
      ],
      'lib/platform/android': [
        'android_config.dart',
      ],
      'lib/platform/ios': [
        'ios_config.dart',
      ],
    };
  }

  /// Ҳисоб кардани шумораи файлҳо
  int countFiles(Map<String, List<String>> structure) {
    int total = 0;
    for (final files in structure.values) {
      total += files.length;
    }
    return total;
  }

  /// Барои debug / preview
  void printStructure(Map<String, List<String>> structure) {
    structure.forEach((folder, files) {
      print('📁 $folder');
      for (final file in files) {
        print('   └─ $file');
      }
    });
  }
}