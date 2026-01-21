import 'character.dart';
import 'character_stats.dart';

Character hero() {
  return Character(
    id: 'hero_01',
    name: 'Shadow Slayer',
    stats: CharacterStats(
      hp: 120,
      attack: 30,
      defense: 10,
      speed: 1.2,
    ),
  );
}