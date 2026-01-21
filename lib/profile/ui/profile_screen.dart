import 'package:flutter/material.dart';
import '../state/profile_controller.dart';
import 'profile_header.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen({super.key, required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = ProfileController();

  @override
  void initState() {
    super.initState();
    controller.load(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        if (controller.state.profile == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: ProfileHeader(
            profile: controller.state.profile!,
            following: controller.state.following,
            onFollow: controller.toggleFollow,
          ),
        );
      },
    );
  }
}
