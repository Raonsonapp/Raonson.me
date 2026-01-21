import 'package:flutter/material.dart';
import 'feed_controller.dart';
import 'feed_category.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedController _controller = FeedController();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await _controller.load();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Raonson"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: FeedCategory.values.map((c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(c.label),
                    selected: _controller.currentCategory == c,
                    onSelected: (_) async {
                      setState(() => loading = true);
                      await _controller.changeCategory(c);
                      setState(() => loading = false);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (_, i) {
                final item = _controller.items[i];
                return ListTile(
                  leading: const Icon(Icons.play_circle),
                  title: Text(item.title),
                  subtitle: Text(item.category.label),
                );
              },
            ),
    );
  }
}