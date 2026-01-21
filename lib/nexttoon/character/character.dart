import 'character_stats.dart';
import 'action_type.dart';

class Character {
  final String id;
  final String name;
  final CharacterStats stats;
  ActionType currentAction = ActionType.idle;

  Character({
    required this.id,
    required this.name,
    required this.stats,
  });
}