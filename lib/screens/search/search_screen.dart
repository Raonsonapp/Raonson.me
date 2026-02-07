import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _q = TextEditingController();
  List<UserModel> users = [];
  bool loading = false;

  Future<void> search() async {
    setState(() => loading = true);
    users = await UserService.search(_q.text.trim());
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        title: TextField(
          controller: _q,
          onSubmitted: (_) => search(),
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: users.length,
              itemBuilder: (_, i) => Container(
                color: Colors.white10,
                alignment: Alignment.center,
                child: Text(
                  users[i].username,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}
