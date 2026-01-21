import 'package:flutter/material.dart';
import '../state/reel_controller.dart';
import 'reel_player.dart';
import 'reel_actions.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final ReelController controller = ReelController();

  @override
  void initState() {
    super.initState();
    controller.loadReels().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: controller.state.reels.length,
      itemBuilder: (context, index) {
        final reel = controller.state.reels[index];
        return Stack(
          children: [
            ReelPlayer(url: reel.videoUrl),
            Positioned(
              right: 12,
              bottom: 80,
              child: ReelActions(
                likes: reel.likes,
                comments: reel.comments,
              ),
            ),
            Positioned(
              left: 12,
              bottom: 20,
              child: Text(
                '@${reel.author}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}