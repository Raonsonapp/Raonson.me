import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_client.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? profile;
  List posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final data = await HttpClient.get(
      '${ApiConfig.baseUrl}/profile',
    );

    setState(() {
      profile = data['user'];
      posts = data['posts'] ?? [];
      loading = false;
    });
  }

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B0F1A),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: Text(profile?['username'] ?? 'Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: ListView(
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.4),
                        blurRadius: 18,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, size: 36, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile?['username'] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      profile?['bio'] ?? 'No bio',
                      style: const TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // STATS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat('Posts', posts.length),
                _stat('Followers', profile?['followers'] ?? 0),
                _stat('Following', profile?['following'] ?? 0),
              ],
            ),
          ),

          const Divider(color: Colors.white12),

          // POSTS GRID
          Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (c, i) {
                return Container(
                  color: const Color(0xFF11162A),
                  child: const Icon(
                    Icons.image,
                    color: Colors.white24,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white54),
        ),
      ],
    );
  }
}
