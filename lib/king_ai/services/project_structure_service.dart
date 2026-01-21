class ProjectStructureService {
  Map<String, List<String>> flutterStructure() {
    return {
      'lib/app': ['app.dart', 'router.dart'],
      'lib/features/auth': ['login_screen.dart', 'register_screen.dart'],
      'lib/features/home': ['home_screen.dart'],
      'lib/features/reels': ['reels_screen.dart'],
      'lib/king_ai': ['core/', 'services/', 'ui/'],
    };
  }

  Map<String, List<String>> gameStructure() {
    return {
      'lib/game/core': ['game_engine.dart'],
      'lib/game/ui': ['game_screen.dart'],
      'lib/game/models': ['player.dart', 'enemy.dart'],
    };
  }
}