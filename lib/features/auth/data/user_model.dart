class UserModel {
  final String uid;
  final String email;
  final String username;
  final String avatarUrl;
  final int followers;
  final int following;
  final int posts;
  final bool isVerified;

  const UserModel({
    required this.uid,
    required this.email,
    required this.username,
    this.avatarUrl = '',
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
    this.isVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'avatarUrl': avatarUrl,
      'followers': followers,
      'following': following,
      'posts': posts,
      'isVerified': isVerified,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
