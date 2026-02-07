import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../services/post_service.dart';

/// =======================================
/// SEARCH SCREEN – RAONSON v2 (FULL)
/// =======================================

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _search = TextEditingController();

  List<PostModel> allPosts = [];
  List<PostModel> filtered = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
    _search.addListener(_filter);
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  // -------------------------------
  // LOAD POSTS
  // -------------------------------
  Future<void> _load() async {
    try {
      final data = await PostService.getPosts();
      setState(() {
        allPosts = data;
        filtered = data;
        loading = false;
      });
    } catch (_) {
      setState(() => loading = false);
    }
  }

  // -------------------------------
  // FILTER
  // -------------------------------
  void _filter() {
    final q = _search.text.toLowerCase();
    setState(() {
      filtered = allPosts
          .where((p) =>
              p.caption.toLowerCase().contains(q) ||
              p.username.toLowerCase().contains(q))
          .toList();
    });
  }

  // -------------------------------
  // BUILD
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : _grid(),
    );
  }

  // -------------------------------
  // APP BAR (SEARCH FIELD)
  // -------------------------------
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          controller: _search,
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // -------------------------------
  // GRID
  // -------------------------------
  Widget _grid() {
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
      itemBuilder: (context, index) {
        return _GridItem(post: filtered[index]);
      },
    );
  }
}

/// =======================================
/// GRID ITEM
/// =======================================

class _GridItem extends StatelessWidget {
  final PostModel post;
  const _GridItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _PostPreview(post: post),
          ),
        );
      },
      child: Container(
        color: const Color(0xFF1C2333),
        child: const Center(
          child: Icon(Icons.image, color: Colors.white24),
        ),
      ),
    );
  }
}

/// =======================================
/// POST PREVIEW (FULLSCREEN)
/// =======================================

class _PostPreview extends StatelessWidget {
  final PostModel post;
  const _PostPreview({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF1C2333),
                child: const Icon(
                  Icons.image,
                  size: 120,
                  color: Colors.white24,
                ),
              ),
            ),
          ),
          _actions(),
          _caption(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _caption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        post.caption,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
