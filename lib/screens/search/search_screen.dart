import 'package:flutter/material.dart';
import '../../services/search_service.dart';
import '../home/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _loading = true;
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await SearchService.explore();
      setState(() {
        _items = data;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1424),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1424),
        elevation: 0,
        title: _searchBar(),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _items.isEmpty
              ? const Center(
                  child: Text(
                    'Nothing here yet',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _load,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(2),
                    itemCount: _items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (c, i) {
                      return _gridItem(_items[i]);
                    },
                  ),
                ),
    );
  }

  // ================= SEARCH BAR =================
  Widget _searchBar() {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 18),
          SizedBox(width: 8),
          Text(
            'Search',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  // ================= GRID ITEM =================
  Widget _gridItem(dynamic item) {
    final String img = item['image_url'] ?? '';
    final bool isVideo = item['is_video'] == true;

    return GestureDetector(
      onTap: () {
        // version 1 → танҳо preview
        showDialog(
          context: context,
          builder: (_) => Dialog(
            backgroundColor: Colors.black,
            insetPadding: EdgeInsets.zero,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.network(
                img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            img,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.broken_image)),
          ),
          if (isVideo)
            const Positioned(
              right: 6,
              top: 6,
              child: Icon(
                Icons.play_arrow,
                size: 18,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
