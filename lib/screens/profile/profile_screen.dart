import 'package:flutter/material.dart';
import '../../services/profile_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ProfileService.myProfile(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final u = snap.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(u["username"], style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text("Posts: ${u["posts_count"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
