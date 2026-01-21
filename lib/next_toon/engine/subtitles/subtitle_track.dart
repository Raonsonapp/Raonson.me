import 'subtitle_line.dart';

class SubtitleTrack {
  final String languageCode; // tj, ru, en
  final List<SubtitleLine> lines;

  SubtitleTrack({
    required this.languageCode,
    required this.lines,
  });
}