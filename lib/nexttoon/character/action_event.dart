import 'action_type.dart';

class ActionEvent {
  final String characterId;
  final ActionType action;
  final Duration at;
  final Map<String, dynamic> payload;

  ActionEvent({
    required this.characterId,
    required this.action,
    required this.at,
    required this.payload,
  });
}