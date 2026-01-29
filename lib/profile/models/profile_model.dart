class ProfileModel {
  final String username;
  final String name;
  final String avatarUrl;
  final String bio;
  final int posts;
  final int followers;
  final int following;
  final List<String> postImages;

  ProfileModel({
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.bio,
    required this.posts,
    required this.followers,
    required this.following,
    required this.postImages,
  });
}
