import 'package:flutter/material.dart';

class GeneratorPromptInput extends StatefulWidget {
  final void Function(String prompt) onGenerate;

  const GeneratorPromptInput({super.key, required this.onGenerate});

  @override
  State<GeneratorPromptInput> createState() => _GeneratorPromptInputState();
}

class _GeneratorPromptInputState extends State<GeneratorPromptInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText:
                  "Describe what you want:\n• App\n• Game\n• Backend\n• UI logic",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                widget.onGenerate(controller.text.trim());
              }
            },
            icon: const Icon(Icons.flash_on),
            label: const Text("Generate"),
          ),
        ],
      ),
    );
  }
}