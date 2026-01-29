import 'package:flutter/material.dart';

class ReelsVideoItem extends StatelessWidget {
  final int index;
  const ReelsVideoItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔲 Видео placeholder (баъд видео мегузорем)
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'REEL VIDEO $index',
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),

        // ❤️ Лайк / Коммент / Шер
        Positioned(
          right: 12,
          bottom: 80,
          child: Column(
            children: const [
              Icon(Icons.favorite, color: Colors.white, size: 32),
              SizedBox(height: 20),
              Icon(Icons.comment, color: Colors.white, size: 30),
              SizedBox(height: 20),
              Icon(Icons.share, color: Colors.white, size: 28),
            ],
          ),
        ),

        // 👤 Ном + описание
        Positioned(
          left: 12,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '@raonson_user',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'This is a reel description...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
