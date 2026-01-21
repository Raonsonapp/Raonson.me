import 'character.dart';

class AttackResolver {
  int resolveDamage(Character attacker, Character target) {
    final raw = attacker.stats.attack - target.stats.defense;
    return raw > 0 ? raw : 1;
  }
}