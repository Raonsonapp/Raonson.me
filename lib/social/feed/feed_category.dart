enum FeedCategory {
  all,
  games,
  music,
  anime,
  movies,
  sports,
  education,
}

extension FeedCategoryX on FeedCategory {
  String get label {
    switch (this) {
      case FeedCategory.games:
        return "Games";
      case FeedCategory.music:
        return "Music";
      case FeedCategory.anime:
        return "Anime";
      case FeedCategory.movies:
        return "Movies";
      case FeedCategory.sports:
        return "Sports";
      case FeedCategory.education:
        return "Education";
      default:
        return "All";
    }
  }
}