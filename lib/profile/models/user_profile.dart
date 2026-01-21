class UserProfile {
  final String id;
  final String username;
  final String avatar;
  final int followers;
  final int following;
  final int posts;
  final bool verified;

  UserProfile({
    required this.id,
    required this.username,
    required this.avatar,
    required this.followers,
    required this.following,
    required this.posts,
    this.verified = false,
import 'package:flutter/material.dart';
import 'export_button.dart';
import 'save_local_button.dart';

class EpisodeActionsBar extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onExport;

  const EpisodeActionsBar({
    super.key,
    required this.onSave,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SaveLocalButton(onSave: onSave),
        ExportButton(onExport: onExport),
      ],
    );
  }
}

  UserProfile copyWith({
    int? followers,
    int? following,
  }) {
    return UserProfile(
      id: id,
      username: username,
      avatar: avatar,
      posts: posts,
      verified: verified,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }
  }
