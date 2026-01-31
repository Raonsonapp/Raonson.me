import 'package:flutter/material.dart';

class CommentSheet extends StatefulWidget {
  const CommentSheet({super.key});

  @override
  State<CommentSheet> createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final TextEditingController controller = TextEditingController();
  final List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Comments", style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(comments[i]),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: "Write comment..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        comments.add(controller.text);
                        controller.clear();
                      });
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
