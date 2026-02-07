import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List items = [];
  @override void initState(){ super.initState(); load(); }
  Future<void> load() async {
    items = await PostService.getPosts();
    setState((){});
  }

  @override
  Widget build(BuildContext c) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
      itemCount: items.length,
      itemBuilder: (_, i) =>
          Container(color: Colors.grey[300], child: const Icon(Icons.image)),
    );
  }
}
