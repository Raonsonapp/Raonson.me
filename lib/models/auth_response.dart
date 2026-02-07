class AuthResponse {
  final String message;
  final String? token;
  final String? username;

  AuthResponse({
    required this.message,
    this.token,
    this.username,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] ?? '',
      token: json['token'],
      username: json['username'],
    );
  }
}
