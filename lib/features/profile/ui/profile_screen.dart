import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("raonson_user"),
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Avatar + Stats
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _StatItem("12", "Posts"),
                        _StatItem("340", "Followers"),
                        _StatItem("180", "Following"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Bio
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Raonson User\nFlutter Developer 🚀",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Edit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Edit Profile"),
              ),
            ),

            const SizedBox(height: 20),

            /// Posts Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Stat Widget
class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}
