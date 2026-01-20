import '../core/anime_style.dart';

class StyleSelector {
  AnimeStyle fromUserChoice(String input) {
    switch (input.toLowerCase()) {
      case 'solo':
        return AnimeStyle.soloLeveling;
      case 'demon':
        return AnimeStyle.demonSlayer;
      case 'jjk':
        return AnimeStyle.jujutsuKaisen;
      default:
        return AnimeStyle.cinematic;
    }
  }
}