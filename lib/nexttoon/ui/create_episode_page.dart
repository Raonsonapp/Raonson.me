import 'package:flutter/material.dart';

class CreateEpisodePage extends StatefulWidget {
  const CreateEpisodePage({super.key});

  @override
  State<CreateEpisodePage> createState() => _CreateEpisodePageState();
}

class _CreateEpisodePageState extends State<CreateEpisodePage> {
  final TextEditingController _scriptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Anime Episode')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _scriptController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Write anime script / story...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nexttoon/progress');
              },
              child: const Text('Generate Episode'),
            )
          ],
        ),
      ),
    );
  }
}
