/// Навъи файл
enum FileRole {
  core,
  config,
  ui,
  state,
  service,
  controller,
  generator,
  model,
  platform,
}

/// Метадатаи файл
class FileMeta {
  final String path;
  final FileRole role;
  final String description;

  const FileMeta({
    required this.path,
    required this.role,
    required this.description,
  });
}

/// Харитаи пурраи файлҳои лоиҳа
class FileMap {
  /// Файлҳои асосии Flutter / Raonson
  static List<FileMeta> baseFiles() {
    return [
      FileMeta(
        path: 'lib/core/app.dart',
        role: FileRole.core,
        description: 'Root application widget',
      ),
      FileMeta(
        path: 'lib/core/app_config.dart',
        role: FileRole.config,
        description: 'Global configuration',
      ),
      FileMeta(
        path: 'lib/navigation/routes.dart',
        role: FileRole.config,
        description: 'Route names',
      ),
      FileMeta(
        path: 'lib/navigation/app_router.dart',
        role: FileRole.controller,
        description: 'Central router',
      ),
    ];
  }

  /// Файлҳои Auth
  static List<FileMeta> authFiles() {
    return [
      FileMeta(
        path: 'lib/auth/auth_controller.dart',
        role: FileRole.controller,
        description: 'Auth logic',
      ),
      FileMeta(
        path: 'lib/auth/auth_service.dart',
        role: FileRole.service,
        description: 'Firebase / API auth',
      ),
      FileMeta(
        path: 'lib/auth/login_screen.dart',
        role: FileRole.ui,
        description: 'Login UI',
      ),
      FileMeta(
        path: 'lib/auth/register_screen.dart',
        role: FileRole.ui,
        description: 'Register UI',
      ),
    ];
  }

  /// Файлҳои Media (Reels / Video)
  static List<FileMeta> mediaFiles() {
    return [
      FileMeta(
        path: 'lib/media/reels/reels_controller.dart',
        role: FileRole.controller,
        description: 'Reels logic',
      ),
      FileMeta(
        path: 'lib/media/reels/reels_service.dart',
        role: FileRole.service,
        description: 'Video feed service',
      ),
      FileMeta(
        path: 'lib/media/reels/reels_screen.dart',
        role: FileRole.ui,
        description: 'Reels UI',
      ),
      FileMeta(
        path: 'lib/media/video/video_quality_selector.dart',
        role: FileRole.ui,
        description: '360p–1080p selector',
      ),
      FileMeta(
        path: 'lib/media/video/video_download.dart',
        role: FileRole.service,
        description: 'Download manager',
      ),
    ];
  }

  /// Файлҳои Chat
  static List<FileMeta> chatFiles() {
    return [
      FileMeta(
        path: 'lib/chat/gpt/chatgpt_service.dart',
        role: FileRole.service,
        description: 'ChatGPT engine',
      ),
      FileMeta(
        path: 'lib/chat/gpt/chatgpt_screen.dart',
        role: FileRole.ui,
        description: 'ChatGPT UI',
      ),
      FileMeta(
        path: 'lib/chat/king_ai/king_ai_controller.dart',
        role: FileRole.controller,
        description: 'King AI brain',
      ),
      FileMeta(
        path: 'lib/chat/king_ai/king_ai_screen.dart',
        role: FileRole.ui,
        description: 'King AI UI',
      ),
    ];
  }

  /// Файлҳои NextToon (аниме)
  static List<FileMeta> nextToonFiles() {
    return [
      FileMeta(
        path: 'lib/nexttoon/episode_generator.dart',
        role: FileRole.generator,
        description: 'Anime episode planner',
      ),
      FileMeta(
        path: 'lib/nexttoon/scene_planner.dart',
        role: FileRole.generator,
        description: 'Scene breakdown',
      ),
      FileMeta(
        path: 'lib/nexttoon/animation_pipeline.dart',
        role: FileRole.generator,
        description: 'Animation pipeline',
      ),
    ];
  }

  /// Ҳама файлҳо якҷоя
  static List<FileMeta> all() {
    return [
      ...baseFiles(),
      ...authFiles(),
      ...mediaFiles(),
      ...chatFiles(),
      ...nextToonFiles(),
    ];
  }

  /// Ҳисобкунии шумораи файлҳо
  static int totalCount() {
    return all().length;
  }
}
