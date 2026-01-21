import 'action_type.dart';

class AnimationState {
  final ActionType action;
  final String animationKey;

  AnimationState({
    required this.action,
    required this.animationKey,
  });
}