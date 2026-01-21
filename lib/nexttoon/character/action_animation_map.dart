import 'action_type.dart';
import 'animation_state.dart';

final Map<ActionType, AnimationState> actionAnimations = {
  ActionType.idle: AnimationState(
    action: ActionType.idle,
    animationKey: 'idle_loop',
  ),
  ActionType.attack: AnimationState(
    action: ActionType.attack,
    animationKey: 'slash_attack',
  ),
  ActionType.special: AnimationState(
    action: ActionType.special,
    animationKey: 'ultimate_fx',
  ),
};
