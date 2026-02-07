class UserModel {
  final String username;
  final String bio;
  final String avatar;
  final int posts;
  final int followers;
  final int following;

  UserModel({
    required this.username,
    required this.bio,
    required this.avatar,
    required this.posts,
    required this.followers,
    required this.following,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      bio: json['bio'] ?? '',
      avatar: json['avatar'] ?? '',
      posts: json['posts'] ?? 0,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
    );
  }
}
