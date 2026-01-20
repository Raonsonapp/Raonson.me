import 'package:flutter/material.dart';
import '../state/feed_controller.dart';
import 'feed_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = FeedController();

  @override
  void initState() {
    super.initState();
    controller.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raonson')),
      body: FeedList(controller: controller),
    );
  }
}