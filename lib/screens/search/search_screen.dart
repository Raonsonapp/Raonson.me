import 'package:flutter/material.dart';
import '../../services/search_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _ctrl = TextEditingController();
  bool _loading = false;
  List<dynamic> _users = [];
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadExplore();
  }

  Future<void> _loadExplore() async {
    setState(() => _loading = true);
    try {
      final data = await SearchService.explore();
      setState(() {
        _posts = data;
        _users = [];
      });
    } catch (_) {}
    setState(() => _loading = false);
  }

  Future<void> _search(String q) async {
    setState(() => _loading = true);
    try {
      final users = await SearchService.searchUsers(q);
      final posts = await SearchService.searchPosts(q);
      setState(() {
        _users = users;
        _posts = posts;
      });
    } catch (_) {}
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _ctrl,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (v) {
            if (v.isEmpty) {
              _loadExplore();
            } else {
              _search(v);
            }
          },
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (_users.isNotEmpty) _usersList(),
                Expanded(child: _grid()),
              ],
            ),
    );
  }

  // ===== USERS LIST =====
  Widget _usersList() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _users.length,
        itemBuilder: (c, i) {
          final u = _users[i]['username'] ?? '';
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const CircleAvatar(radius: 26, child: Icon(Icons.person)),
                const SizedBox(height: 6),
                Text(
                  u,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ===== POSTS GRID =====
  Widget _grid() {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _posts.length,
      itemBuilder: (c, i) {
        final img = _posts[i]['image_url'] ?? '';
        return img.isEmpty
            ? const ColoredBox(color: Colors.black12)
            : Image.network(img, fit: BoxFit.cover);
      },
    );
  }
}
