class KingAIContext {
  final String projectName;
  final String platform; // flutter / android / ios / game
  final int complexityLevel; // 1–10
  final bool premiumUser;

  KingAIContext({
    required this.projectName,
    required this.platform,
    required this.complexityLevel,
    required this.premiumUser,
  });
}