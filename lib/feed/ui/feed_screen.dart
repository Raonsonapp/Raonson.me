import 'package:flutter/material.dart';
import '../state/feed_controller.dart';
import 'post_card.dart';
import 'reel_player.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedController controller = FeedController();

  @override
  void initState() {
    super.initState();
    controller.load().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      children: controller.state.items.map((item) {
        if (item.type.name == 'video') {
          return ReelPlayer(url: item.contentUrl);
        }
        return PostCard(
          item: item,
          onLike: () {
            setState(() {
              controller.like(item.id);
            });
          },
        );
      }).toList(),
    );
  }
}
