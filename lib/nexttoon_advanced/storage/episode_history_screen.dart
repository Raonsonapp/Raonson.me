import 'package:flutter/material.dart';
import '../../storage/episode_storage.dart';
import '../../models/episode_model.dart';

class EpisodeHistoryScreen extends StatefulWidget {
  const EpisodeHistoryScreen({super.key});

  @override
  State<EpisodeHistoryScreen> createState() => _EpisodeHistoryScreenState();
}

class _EpisodeHistoryScreenState extends State<EpisodeHistoryScreen> {
  final storage = EpisodeStorage();
  List<EpisodeModel> episodes = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    episodes = await storage.loadEpisodes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Episode History")),
      body: ListView.builder(
        itemCount: episodes.length,
        itemBuilder: (_, i) {
          final e = episodes[i];
          return ListTile(
            title: Text(e.title),
            subtitle: Text(e.createdAt.toString()),
            trailing: e.isDraft ? const Text("Draft") : const Text("Done"),
          );
        },
      ),
    );
  }
}