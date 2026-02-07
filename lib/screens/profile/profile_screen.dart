import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_service.dart';
import '../../core/session.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = '';
  bool _loading = true;
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final u = await Session.username() ?? '';
    setState(() => _username = u);
    await _loadMyPosts(u);
  }

  Future<void> _loadMyPosts(String u) async {
    try {
      final data = await HttpService.get(Api.postByUser(u));
      setState(() {
        _posts = data ?? [];
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_username),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Session.logout();
              if (mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _header(),
                const Divider(),
                Expanded(child: _grid()),
              ],
            ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(radius: 36, child: Icon(Icons.person)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_username,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('${_posts.length} posts'),
            ],
          )
        ],
      ),
    );
  }

  Widget _grid() {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _posts.length,
      itemBuilder: (c, i) {
        final img = _posts[i]['image_url'] ?? '';
        return img.isEmpty
            ? const ColoredBox(color: Colors.black12)
            : Image.network(img, fit: BoxFit.cover);
      },
    );
  }
}
