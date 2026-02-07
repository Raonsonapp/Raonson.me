import 'package:flutter/material.dart';

/// ===============================
/// SEARCH SCREEN – RAONSON v2
/// Instagram-style explore grid
/// ===============================

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  // Mock explore data (ба сервер иваз мешавад)
  final List<_ExploreItem> items = List.generate(
    30,
    (i) => _ExploreItem(id: i),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
            const SizedBox(height: 8),
            Expanded(child: _grid()),
          ],
        ),
      ),
    );
  }

  // -------------------------------
  // SEARCH BAR
  // -------------------------------
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.25),
              Colors.cyanAccent.withOpacity(0.15),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4),
              blurRadius: 10,
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white70),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // TODO: search logic (API)
          },
        ),
      ),
    );
  }

  // -------------------------------
  // GRID VIEW
  // -------------------------------
  Widget _grid() {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _gridItem(items[index]);
      },
    );
  }

  Widget _gridItem(_ExploreItem item) {
    return GestureDetector(
      onTap: () {
        _openPreview(item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C2333),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(
            Icons.image,
            color: Colors.white24,
            size: 32,
          ),
        ),
      ),
    );
  }

  // -------------------------------
  // PREVIEW (BOTTOM SHEET)
  // -------------------------------
  void _openPreview(_ExploreItem item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0B0F1A),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              _sheetHandle(),
              const SizedBox(height: 12),
              _previewContent(item),
            ],
          ),
        );
      },
    );
  }

  Widget _sheetHandle() {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _previewContent(_ExploreItem item) {
    return Expanded(
      child: ListView(
        children: [
          _previewMedia(),
          _previewActions(),
          _previewCaption(),
        ],
      ),
    );
  }

  Widget _previewMedia() {
    return Container(
      height: 360,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2333),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 90, color: Colors.white24),
      ),
    );
  }

  Widget _previewActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 18),
          Icon(Icons.chat_bubble_outline),
          SizedBox(width: 18),
          Icon(Icons.send),
          Spacer(),
          Icon(Icons.bookmark_border),
        ],
      ),
    );
  }

  Widget _previewCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Explore post caption example for Raonson.',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}

/// ===============================
/// EXPLORE ITEM MODEL
/// ===============================
class _ExploreItem {
  final int id;

  _ExploreItem({required this.id});
}
