import 'package:flutter/material.dart';
import 'create_episode_page.dart';
import 'generation_progress_page.dart';
import 'episode_preview_page.dart';

class NextToonRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/nexttoon/create': (_) => const CreateEpisodePage(),
    '/nexttoon/progress': (_) => const GenerationProgressPage(),
    '/nexttoon/preview': (_) => const EpisodePreviewPage(),
  };
}