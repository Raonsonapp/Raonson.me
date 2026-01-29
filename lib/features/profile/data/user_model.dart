class UserModel {
  final String id;
  final String username;
  final String name;
  final String avatar;
  final String bio;
  final int posts;
  final int followers;
  final int following;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.avatar,
    required this.bio,
    required this.posts,
    required this.followers,
    required this.following,
  });
}
