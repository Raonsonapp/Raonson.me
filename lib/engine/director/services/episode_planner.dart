import '../core/script.dart';
import 'script_parser.dart';
import 'scene_planner.dart';
import '../../video/core/episode.dart';
import '../../video/core/timeline.dart';

class EpisodePlanner {
  Future<Episode> plan(Script script) async {
    final directives = ScriptParser().parse(script.text);
    final scenes = <dynamic>[];

    for (var i = 0; i < directives.length; i++) {
      scenes.add(ScenePlanner().plan(directives[i], i));
    }

    return Episode(
      title: script.title,
      timeline: Timeline(scenes.cast()),
      resolution: '1080p',
    );
  }
}
