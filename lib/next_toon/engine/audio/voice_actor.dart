class VoiceActor {
  final String id;
  final String name;
  final String language;
  final String gender;
  final bool premium;

  VoiceActor({
    required this.id,
    required this.name,
    required this.language,
    required this.gender,
    this.premium = false,
  });
}