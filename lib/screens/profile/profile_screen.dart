import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map profile = {};
  List posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      // барои v2 оддӣ: сервер профили user-и ҷориро бармегардонад
      final resProfile = await http.get(
        Uri.parse('https://raonson-me.onrender.com/profile'),
      );

      final resPosts = await http.get(
        Uri.parse('https://raonson-me.onrender.com/posts'),
      );

      if (resProfile.statusCode == 200 &&
          resPosts.statusCode == 200) {
        setState(() {
          profile = jsonDecode(resProfile.body);
          posts = jsonDecode(resPosts.body);
          loading = false;
        });
      } else {
        setState(() => loading = false);
      }
    } catch (_) {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchProfile,
              child: ListView(
                children: [
                  _header(),
                  const SizedBox(height: 12),
                  _stats(),
                  const SizedBox(height: 16),
                  _bio(),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white12),
                  _postGrid(),
                ],
              ),
            ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.35),
                  blurRadius: 14,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile['username'] ?? 'user',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF11162A),
                  ),
                  child: const Text('Edit profile'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem(posts.length.toString(), 'Posts'),
          _statItem(
            (profile['followers'] ?? 0).toString(),
            'Followers',
          ),
          _statItem(
            (profile['following'] ?? 0).toString(),
            'Following',
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
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

  Widget _bio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        profile['bio'] ?? 'No bio yet',
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _postGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(4),
      itemCount: posts.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF11162A),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.12),
                blurRadius: 6,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.image,
              color: Colors.white24,
              size: 40,
            ),
          ),
        );
      },
    );
  }
}
