import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/http_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List posts = [];
  bool loading = true;
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await HttpService.get('/posts');
    posts = jsonDecode(res.body);
    setState(() => loading = false);
  }

  @override
  void dispose() {
    _search.dispose();
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
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : _grid(),
            ),
          ],
        ),
      ),
    );
  }

  // ================= SEARCH BAR =================
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(Icons.search, color: Colors.white54),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _search,
                onChanged: (v) {
                  setState(() {}); // filter realtime
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            if (_search.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: () {
                  _search.clear();
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }

  // ================= GRID =================
  Widget _grid() {
    final filtered = posts.where((p) {
      if (_search.text.isEmpty) return true;
      return p['caption']
          .toString()
          .toLowerCase()
          .contains(_search.text.toLowerCase());
    }).toList();

    if (filtered.isEmpty) {
      return const Center(
        child: Text(
          'No results',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: filtered.length,
      itemBuilder: (_, i) => _gridItem(filtered[i], i),
    );
  }

  // ================= GRID ITEM =================
  Widget _gridItem(dynamic post, int index) {
    return GestureDetector(
      onTap: () => _openPreview(post),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141B2D),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.image,
                color: Colors.white24,
                size: 40,
              ),
            ),
            if (index % 5 == 0)
              const Positioned(
                right: 6,
                top: 6,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white70,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ================= PREVIEW =================
  void _openPreview(dynamic post) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0B0F1A),
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _previewHeader(post),
              Expanded(child: _previewMedia()),
              _previewActions(post),
              _previewCaption(post),
            ],
          ),
        );
      },
    );
  }

  Widget _previewHeader(dynamic post) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.person),
      ),
      title: Text(
        post['username'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _previewMedia() {
    return Container(
      color: const Color(0xFF141B2D),
      child: const Center(
        child: Icon(
          Icons.image,
          size: 100,
          color: Colors.white24,
        ),
      ),
    );
  }

  Widget _previewActions(dynamic post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () async {
              await HttpService.post('/posts/${post['id']}/like', {});
            },
          ),
          const Icon(Icons.comment),
          const Icon(Icons.send),
          const Spacer(),
          const Icon(Icons.bookmark_border),
        ],
      ),
    );
  }

  Widget _previewCaption(dynamic post) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        post['caption'],
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
