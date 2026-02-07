import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List posts = [];
  @override void initState(){ super.initState(); load(); }
  Future<void> load() async {
    posts = await PostService.getPosts();
    setState((){});
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.add_box_outlined), SizedBox(width:8),
          Text('Raonson')
        ]),
        actions: const [Icon(Icons.smart_toy)],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, i) {
          final p = posts[i];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(title: Text(p['username'])),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(p['caption']),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () async {
                        await PostService.like(p['id']);
                      },
                    ),
                    const Icon(Icons.comment),
                    const Icon(Icons.send),
                    const Spacer(),
                    const Icon(Icons.bookmark_border),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
