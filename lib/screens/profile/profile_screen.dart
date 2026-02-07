import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';
import '../../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? me;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    me = await UserService.me();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (me == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        title: Text(me!.username),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white24,
                child: Text(
                  me!.username[0].toUpperCase(),
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(width: 24),
              _stat('Posts', me!.posts),
              _stat('Followers', me!.followers),
              _stat('Following', me!.following),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            me!.bio,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24),
          const SizedBox(height: 12),
          const Text(
            'Posts',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _stat(String t, int v) => Expanded(
        child: Column(
          children: [
            Text('$v',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(t, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      );
}
