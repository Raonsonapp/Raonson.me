import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedChip = 0;

  final chips = ['All', 'Travel', 'Music', 'Food', 'Art'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _SearchBar(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: chips.length,
              itemBuilder: (context, index) {
                final isActive = selectedChip == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(chips[index]),
                    selected: isActive,
                    onSelected: (_) {
                      setState(() => selectedChip = index);
                    },
                    selectedColor: const Color(0xFF1E88E5),
                    backgroundColor: Colors.white10,
                    labelStyle: TextStyle(
                      color: isActive ? Colors.white : Colors.white70,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: mockGrid.length,
              itemBuilder: (context, index) {
                return Image.network(
                  mockGrid[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- SEARCH BAR ---------------- */

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 20),
          SizedBox(width: 8),
          Text(
            'Search',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

/* ---------------- MOCK DATA ---------------- */

final mockGrid = List.generate(
  30,
  (i) => 'https://picsum.photos/300/300?random=${i + 20}',
);
