import 'package:flutter/material.dart';
import 'generator_prompt_input.dart';
import 'generator_action_bar.dart';
import 'generator_result_view.dart';

class KingGeneratorPage extends StatefulWidget {
  const KingGeneratorPage({super.key});

  @override
  State<KingGeneratorPage> createState() => _KingGeneratorPageState();
}

class _KingGeneratorPageState extends State<KingGeneratorPage> {
  String? result;

  void onGenerate(String prompt) {
    setState(() {
      result = "⏳ King AI is generating...\n\n$prompt";
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        result = "✅ GENERATED RESULT\n\nApp/Game created based on:\n$prompt";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("King AI Generator"),
      ),
      body: Column(
        children: [
          GeneratorPromptInput(onGenerate: onGenerate),
          const SizedBox(height: 8),
          const GeneratorActionBar(),
          const Divider(),
          Expanded(
            child: GeneratorResultView(result: result),
          ),
        ],
      ),
    );
  }
}