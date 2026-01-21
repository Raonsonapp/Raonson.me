import 'episode_plan.dart';
import 'style_preset.dart';

class DirectorSession {
  final String sessionId;
  final EpisodePlan plan;
  final StylePreset preset;

  DirectorSession({
    required this.sessionId,
    required this.plan,
    required this.preset,
  });
}