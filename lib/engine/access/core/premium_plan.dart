class PremiumPlan {
  final String id;
  final int maxMinutes;
  final bool allowDubbing;
  final bool allowAnimeRender;

  PremiumPlan({
    required this.id,
    required this.maxMinutes,
    required this.allowDubbing,
    required this.allowAnimeRender,
  });
}