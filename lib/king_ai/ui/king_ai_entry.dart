import 'package:flutter/material.dart';

import 'generation_console.dart';

class KingAIEntryPage extends StatefulWidget {
  const KingAIEntryPage({super.key});

  @override
  State<KingAIEntryPage> createState() => _KingAIEntryPageState();
}

class _KingAIEntryPageState extends State<KingAIEntryPage> {
  int _index = 0;

  final _pages = const [
    _KingAIDashboard(),
    GenerationConsole(),
    _KingAISettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_fix_high),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/* ------------------ DASHBOARD ------------------ */

class _KingAIDashboard extends StatelessWidget {
  const _KingAIDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('King AI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Capabilities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _CapabilityTile('🎮 Game Generator', 'Build full games'),
            _CapabilityTile('🎬 Anime / Video Generator', 'NextToon engine'),
            _CapabilityTile('🧠 App / Backend Generator', 'Flutter, APIs'),
            _CapabilityTile('📁 Massive File Output', '1000+ files'),
          ],
        ),
      ),
    );
  }
}

class _CapabilityTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _CapabilityTile(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

/* ------------------ SETTINGS ------------------ */

class _KingAISettings extends StatelessWidget {
  const _KingAISettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('King AI Settings')),
      body: ListView(
        children: const [
          SwitchListTile(
            value: true,
            onChanged: null,
            title: Text('Long task mode'),
            subtitle: Text('Allow multi-hour generation'),
          ),
          SwitchListTile(
            value: true,
            onChanged: null,
            title: Text('Auto batching'),
            subtitle: Text('Split tasks into safe chunks'),
          ),
          SwitchListTile(
            value: true,
            onChanged: null,
            title: Text('Crash recovery'),
            subtitle: Text('Resume on interruption'),
          ),
        ],
      ),
    );
  }
}