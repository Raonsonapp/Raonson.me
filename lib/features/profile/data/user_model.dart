class UserModel {
  final String username;
  final String avatar;
  final String bio;
  final int posts;
  final int followers;
  final int following;
  final bool verified;

  UserModel({
    required this.username,
    required this.avatar,
    required this.bio,
    required this.posts,
    required this.followers,
    required this.following,
    this.verified = false,
  });
}
