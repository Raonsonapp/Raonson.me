import 'character.dart';
import 'action_event.dart';

class ActionController {
  final Map<String, Character> _characters = {};

  void register(Character character) {
    _characters[character.id] = character;
  }

  void apply(ActionEvent event) {
    final character = _characters[event.characterId];
    if (character == null) return;

    character.currentAction = event.action;
  }
}