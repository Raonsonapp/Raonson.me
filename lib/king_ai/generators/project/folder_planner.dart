/// FolderPlanner
/// Муайян мекунад: тартиб, вобастагӣ ва қоидаҳои папкаҳо
class FolderPlanner {
  /// Тартиби сохтани папкаҳо (аз поён ба боло)
  List<String> buildOrder() {
    return [
      'lib/core',
      'lib/navigation',
      'lib/auth',
      'lib/ui',
      'lib/media',
      'lib/chat',
      'lib/king_ai',
      'lib/nexttoon',
      'lib/platform',
    ];
  }

  /// Вобастагиҳои папкаҳо
  Map<String, List<String>> dependencies() {
    return {
      'lib/navigation': ['lib/core'],
      'lib/auth': ['lib/core', 'lib/navigation'],
      'lib/ui': ['lib/core', 'lib/navigation'],
      'lib/media': ['lib/core', 'lib/ui'],
      'lib/chat': ['lib/core', 'lib/ui'],
      'lib/king_ai': ['lib/core', 'lib/chat'],
      'lib/nexttoon': ['lib/core', 'lib/media'],
      'lib/platform': ['lib/core'],
    };
  }

  /// Санҷиш: оё тартиб дуруст аст ё не
  bool validateOrder(List<String> order) {
    final deps = dependencies();

    for (final folder in order) {
      final required = deps[folder] ?? [];
      for (final dep in required) {
        if (!order.contains(dep) ||
            order.indexOf(dep) > order.indexOf(folder)) {
          return false;
        }
      }
    }
    return true;
  }

  /// Пешнамоиши архитектура (debug)
  void printPlan() {
    final order = buildOrder();
    final deps = dependencies();

    for (final folder in order) {
      final required = deps[folder] ?? [];
      print('📁 $folder');
      if (required.isNotEmpty) {
        print('   ↳ depends on: ${required.join(', ')}');
      }
    }
  }
}