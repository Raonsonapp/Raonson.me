enum SearchCategory {
  games,
  music,
  anime,
  sports,
  programs,
}

extension SearchCategoryX on SearchCategory {
  String get label {
    switch (this) {
      case SearchCategory.games:
        return 'Games';
      case SearchCategory.music:
        return 'Music';
      case SearchCategory.anime:
        return 'Anime';
      case SearchCategory.sports:
        return 'Sports';
      case SearchCategory.programs:
        return 'Programs';
    }
  }
}
