import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.video_library)),
        Tab(icon: Icon(Icons.person_pin)),
      ],
    );
  }
}
