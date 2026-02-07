import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List items = [];
  bool loading = true;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSearch();
  }

  Future<void> fetchSearch([String query = '']) async {
    setState(() => loading = true);

    try {
      final uri = query.isEmpty
          ? Uri.parse('https://raonson-me.onrender.com/search')
          : Uri.parse(
              'https://raonson-me.onrender.com/search?q=$query',
            );

      final res = await http.get(uri);

      if (res.statusCode == 200) {
        setState(() {
          items = jsonDecode(res.body);
          loading = false;
        });
      } else {
        setState(() => loading = false);
      }
    } catch (_) {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              icon: Icon(Icons.search, color: Colors.white54),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            onSubmitted: (v) => fetchSearch(v),
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(3),
              itemCount: items.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return _SearchItem(item: item);
              },
            ),
    );
  }
}

class _SearchItem extends StatelessWidget {
  final Map item;

  const _SearchItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF11162A),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.white24,
          size: 40,
        ),
      ),
    );
  }
}
