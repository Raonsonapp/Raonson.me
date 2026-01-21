import 'package:flutter/material.dart';
import '../state/profile_controller.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_stats_row.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen({super.key, required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
    controller.load(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  profile: controller.profile!,
                  verified: controller.verified,
                  isFollowing: controller.isFollowing,
                  onFollowTap: controller.toggleFollow,
                ),
                const SizedBox(height: 12),
                ProfileStatsRow(stats: controller.stats!),
              ],
            ),
          );
        },
      ),
    );
  }
}
