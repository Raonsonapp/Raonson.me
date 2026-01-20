class SessionModel {
  final String token;
  final DateTime expiresAt;

  SessionModel({
    required this.token,
    required this.expiresAt,
  });

  bool get isValid => DateTime.now().isBefore(expiresAt);
}