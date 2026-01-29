import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_stats.dart';
import 'widgets/profile_buttons.dart';
import 'widgets/profile_tabs.dart';
import 'widgets/profile_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text('raonson', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: const [
            Icon(Icons.add_box_outlined),
            SizedBox(width: 16),
            Icon(Icons.menu),
            SizedBox(width: 12),
          ],
        ),
        body: Column(
          children: const [
            ProfileHeader(),
            ProfileButtons(),
            ProfileTabs(),
            Expanded(child: ProfileGrid()),
          ],
        ),
      ),
    );
  }
}
