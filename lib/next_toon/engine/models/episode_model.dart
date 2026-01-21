enum EpisodeStatus {
  draft,
  queued,
  rendering,
  completed,
  failed,
}

class ToonEpisode {
  final String id;
  final String title;
  final int durationMinutes; // 8–10 дақиқа
  final DateTime createdAt;

  EpisodeStatus status;

  ToonEpisode({
    required this.id,
    required this.title,
    required this.durationMinutes,
    required this.createdAt,
    this.status = EpisodeStatus.draft,
  });

  ToonEpisode copyWith({
    EpisodeStatus? status,
  }) {
    return ToonEpisode(
      id: id,
      title: title,
      durationMinutes: durationMinutes,
      createdAt: createdAt,
      status: status ?? this.status,
    );
  }
}
