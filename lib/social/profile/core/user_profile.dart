class UserProfile {
  final String uid;
  final String username;
  final String displayName;
  final String avatarUrl;
  final bool isVerified;
  final bool isPrivate;
  final int followers;
  final int following;

  UserProfile({
    required this.uid,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.isVerified,
    required this.isPrivate,
    required this.followers,
    required this.following,
  });
}