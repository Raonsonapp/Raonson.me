import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});
  @override State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List reels = [];
  @override void initState(){ super.initState(); load(); }
  Future<void> load() async {
    reels = await PostService.getPosts();
    setState((){});
  }

  @override
  Widget build(BuildContext c) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: reels.length,
      itemBuilder: (_, i) => Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(child: Text(reels[i]['caption'],
              style: const TextStyle(color: Colors.white, fontSize: 22))),
            Positioned(
              right: 12, bottom: 80,
              child: Column(children: const [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(height:16),
                Icon(Icons.comment, color: Colors.white),
                SizedBox(height:16),
                Icon(Icons.send, color: Colors.white),
                SizedBox(height:16),
                Icon(Icons.bookmark, color: Colors.white),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
