enum DubLanguage {
  japanese,
  english,
  russian,
  persian,
  tajik,
}

extension DubLanguageExt on DubLanguage {
  String get code {
    switch (this) {
      case DubLanguage.japanese:
        return 'ja';
      case DubLanguage.english:
        return 'en';
      case DubLanguage.russian:
        return 'ru';
      case DubLanguage.persian:
        return 'fa';
      case DubLanguage.tajik:
        return 'tg';
    }
  }

  String get label {
    switch (this) {
      case DubLanguage.japanese:
        return 'Japanese';
      case DubLanguage.english:
        return 'English';
      case DubLanguage.russian:
        return 'Russian';
      case DubLanguage.persian:
        return 'Persian';
      case DubLanguage.tajik:
        return 'Tajik';
    }
  }
}