class UserModel {
  final String id;
  final String email;
  final String username;
  final bool isVerified;
  final bool isPremium;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.isVerified,
    required this.isPremium,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      isVerified: json['verified'] ?? false,
      isPremium: json['premium'] ?? false,
    );
  }
}