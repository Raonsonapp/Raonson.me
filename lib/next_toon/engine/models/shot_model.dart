enum ShotType {
  wide,
  medium,
  closeUp,
  action,
}

class ToonShot {
  final String id;
  final ShotType type;
  final String prompt; // prompt барои AI video
  final int durationSeconds;

  ToonShot({
    required this.id,
    required this.type,
    required this.prompt,
    required this.durationSeconds,
  });
}