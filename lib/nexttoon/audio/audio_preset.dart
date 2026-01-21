class AudioPreset {
  final String name;
  final double voiceLevel;
  final double musicLevel;
  final double sfxLevel;

  const AudioPreset({
    required this.name,
    required this.voiceLevel,
    required this.musicLevel,
    required this.sfxLevel,
  });

  static const animeDialog = AudioPreset(
    name: 'Anime Dialog',
    voiceLevel: 0.9,
    musicLevel: 0.4,
    sfxLevel: 0.7,
  );

  static const battleScene = AudioPreset(
    name: 'Battle Scene',
    voiceLevel: 0.8,
    musicLevel: 0.6,
    sfxLevel: 0.9,
  );
}