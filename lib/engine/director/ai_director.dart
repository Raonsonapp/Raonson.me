import 'core/script.dart';
import 'services/episode_planner.dart';
import '../video/core/episode.dart';

class AIDirector {
  AIDirector._();
  static final instance = AIDirector._();

  Future<Episode> createEpisode(Script script) async {
    return EpisodePlanner().plan(script);
  }
}