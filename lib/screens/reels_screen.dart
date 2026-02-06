import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ReelItem();
        },
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  const ReelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ===== BACKGROUND (VIDEO PLACEHOLDER) =====
        Positioned.fill(
          child: Image.network(
            'https://picsum.photos/600/1000',
            fit: BoxFit.cover,
          ),
        ),

        // ===== GRADIENT OVERLAY =====
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
        ),

        // ===== RIGHT ACTION BAR =====
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: [
              _ActionButton(
                icon: Icons.favorite,
                label: '12.4K',
                color: Colors.pinkAccent,
              ),
              const SizedBox(height: 20),
              _ActionButton(
                icon: Icons.chat_bubble,
                label: '322',
              ),
              const SizedBox(height: 20),
              _ActionButton(
                icon: Icons.send,
                label: 'Share',
              ),
              const SizedBox(height: 20),
              _ActionButton(
                icon: Icons.bookmark,
                label: 'Save',
              ),
            ],
          ),
        ),

        // ===== BOTTOM USER INFO =====
        Positioned(
          left: 12,
          bottom: 30,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4FC3F7),
                          Color(0xFF1E88E5),
                        ],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/150'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'ardamehr',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.verified,
                    color: Color(0xFF4FC3F7),
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Sunset vibes 🌅  #raonson #reels',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (color ?? const Color(0xFF4FC3F7)).withOpacity(0.6),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: color ?? Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
