import 'package:flutter/material.dart';
import '../core/auth_storage.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await AuthStorage.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ardamehr'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(height: 16),
          _ProfileHeader(),
          SizedBox(height: 20),
          _ProfileActions(),
          SizedBox(height: 20),
          Divider(color: Colors.white12),
          _PostsGrid(),
        ],
      ),
    );
  }
}

// =======================
// PROFILE HEADER
// =======================

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF1E88E5)],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 38,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/300'),
                ),
              ),
              const SizedBox(width: 24),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatItem(label: 'Posts', value: '128'),
                    _StatItem(label: 'Followers', value: '12.4K'),
                    _StatItem(label: 'Following', value: '312'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: const [
              Text(
                'Ardamehr',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 6),
              Icon(Icons.verified, size: 18, color: Color(0xFF4FC3F7)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Founder of Raonson 💙\nBuilding something different.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }
}

// =======================
// ACTION BUTTONS
// =======================

class _ProfileActions extends StatelessWidget {
  const _ProfileActions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(text: 'Edit Profile', filled: true),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ActionButton(text: 'Share Profile', filled: false),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final bool filled;

  const _ActionButton({required this.text, required this.filled});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled ? const Color(0xFF1E88E5) : Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

// =======================
// POSTS GRID
// =======================

class _PostsGrid extends StatelessWidget {
  const _PostsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: 24,
      itemBuilder: (context, index) {
        return Image.network(
          'https://picsum.photos/id/${index + 10}/400/400',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
