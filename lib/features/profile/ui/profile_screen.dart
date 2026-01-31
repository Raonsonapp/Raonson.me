import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // TOP BAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Text(
                    "raonson_user",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.menu),
                ],
              ),
            ),

            // AVATAR + STATS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const Spacer(),
                  _stat("12", "Posts"),
                  _stat("540", "Followers"),
                  _stat("320", "Following"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // BIO
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Raonson Official",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Create • Share • Build 🚀"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // EDIT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("Edit Profile"),
              ),
            ),

            const SizedBox(height: 16),

            // POSTS GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (_, __) {
                return Container(color: Colors.grey[300]);
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _stat(String number, String label) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label),
        const SizedBox(width: 20),
      ],
    );
  }
}
