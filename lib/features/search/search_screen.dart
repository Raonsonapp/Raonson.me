import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _SearchBar(),
            const SizedBox(height: 8),
            _Categories(),
            const SizedBox(height: 8),
            Expanded(child: _ExploreGrid()),
          ],
        ),
      ),
    );
  }
}

// ================= SEARCH BAR =================

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

// ================= CATEGORIES =================

class _Categories extends StatelessWidget {
  final List<String> categories = const [
    'Games',
    'Music',
    'Sports',
    'Anime',
    'Movies',
    'AI',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Chip(
            label: Text(categories[index]),
            backgroundColor: Colors.grey.shade100,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: categories.length,
      ),
    );
  }
}

// ================= EXPLORE GRID =================

class _ExploreGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.play_arrow, size: 30),
          ),
        );
      },
    );
  }
}
