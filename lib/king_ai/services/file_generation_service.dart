class FileGenerationService {
  List<String> generateFilesForApp(String appName) {
    return [
      'lib/main.dart',
      'lib/app/app.dart',
      'lib/app/router.dart',
      'lib/features/auth/login_screen.dart',
      'lib/features/home/home_screen.dart',
      'lib/features/reels/reels_screen.dart',
    ];
  }

  List<String> generateFilesForGame(String gameName) {
    return [
      'lib/game/core/game_engine.dart',
      'lib/game/ui/game_ui.dart',
      'lib/game/models/player.dart',
    ];
  }
}