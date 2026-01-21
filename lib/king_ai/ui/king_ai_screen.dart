import 'package:flutter/material.dart';
import '../state/king_ai_controller.dart';
import '../state/king_ai_status.dart';
import 'king_ai_chat_input.dart';
import 'king_ai_progress.dart';
import 'king_ai_result_view.dart';

class KingAIScreen extends StatefulWidget {
  const KingAIScreen({super.key});

  @override
  State<KingAIScreen> createState() => _KingAIScreenState();
}

class _KingAIScreenState extends State<KingAIScreen> {
  final KingAIController controller = KingAIController();

  @override
  Widget build(BuildContext context) {
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('KING AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildBody(state),
          ),
          KingAIChatInput(
            onSend: (text) async {
              // Ин ҷо task/context аз UI дода мешавад (дар қадамҳои баъдӣ пайваст мекунем)
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(state) {
    switch (state.status) {
      case KingAIStatus.running:
      case KingAIStatus.generatingFiles:
      case KingAIStatus.buildingProject:
        return KingAIProgress(state: state);
      case KingAIStatus.completed:
        return KingAIResultView(result: state.result);
      case KingAIStatus.error:
        return Center(child: Text(state.message ?? 'Error'));
      default:
        return const Center(child: Text('Ask KING AI to build something'));
    }
  }
}