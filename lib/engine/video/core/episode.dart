import 'timeline.dart';

class Episode {
  final String title;
  final Timeline timeline;
  final String resolution; // 1080p / 4K

  Episode({
    required this.title,
    required this.timeline,
    this.resolution = '1080p',
  });
}
