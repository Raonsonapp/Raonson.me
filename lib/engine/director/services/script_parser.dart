import '../core/directive.dart';

class ScriptParser {
  List<Directive> parse(String text) {
    final lines = text.split('\n');

    return lines.map((l) {
      return Directive(
        action: l,
        mood: 'intense',
        duration: 20,
      );
    }).toList();
  }
}