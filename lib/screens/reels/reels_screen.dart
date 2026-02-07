import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../models/reel.dart';
import '../../services/reels_service.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _page = PageController();
  List<Reel> reels = [];
  bool loading = true;
  VideoPlayerController? _vc;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    reels = await ReelsService.fetchReels();
    setState(() => loading = false);
    if (reels.isNotEmpty) _initVideo(0);
  }

  Future<void> _initVideo(int i) async {
    await _vc?.dispose();
    _vc = VideoPlayerController.networkUrl(Uri.parse(reels[i].videoUrl));
    await _vc!.initialize();
    _vc!.setLooping(true);
    _vc!.play();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _vc?.dispose();
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _page,
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        onPageChanged: _initVideo,
        itemBuilder: (_, i) => Stack(
          children: [
            if (_vc != null && _vc!.value.isInitialized)
              Center(
                child: AspectRatio(
                  aspectRatio: _vc!.value.aspectRatio,
                  child: VideoPlayer(_vc!),
                ),
              ),

            // RIGHT ACTIONS
            Positioned(
              right: 12,
              bottom: 120,
              child: Column(
                children: const [
                  Icon(Icons.favorite_border, color: Colors.white, size: 30),
                  SizedBox(height: 18),
                  Icon(Icons.chat_bubble_outline,
                      color: Colors.white, size: 28),
                  SizedBox(height: 18),
                  Icon(Icons.send_outlined, color: Colors.white, size: 28),
                  SizedBox(height: 18),
                  Icon(Icons.bookmark_border, color: Colors.white, size: 28),
                ],
              ),
            ),

            // BOTTOM INFO
            Positioned(
              left: 12,
              bottom: 24,
              right: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@${reels[i].username}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reels[i].caption,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
