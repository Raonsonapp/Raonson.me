import 'character.dart';
import 'attack_resolver.dart';

class BattleEngine {
  final AttackResolver resolver = AttackResolver();

  void attack(Character attacker, Character target) {
    final damage = resolver.resolveDamage(attacker, target);
    final newHp = target.stats.hp - damage;

    if (newHp <= 0) {
      target.currentAction = ActionType.die;
    } else {
      target.currentAction = ActionType.hit;
    }
  }
}