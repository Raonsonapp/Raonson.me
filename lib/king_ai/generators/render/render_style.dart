class RenderStyle {
  final String name;
  final bool cinematic;
  final bool animeLines;
  final bool particles;

  const RenderStyle({
    required this.name,
    required this.cinematic,
    required this.animeLines,
    required this.particles,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "cinematic": cinematic,
        "anime_lines": animeLines,
        "particles": particles,
      };
}