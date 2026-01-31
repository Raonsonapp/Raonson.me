import 'package:flutter/material.dart';

void main() {
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  const RaonsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raonson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

/* ================= MAIN NAV ================= */

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    UploadScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

/* ================= HOME ================= */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Raonson")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.black12,
                  child: const Center(
                    child: Icon(Icons.image, size: 80),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.favorite_border),
                    Icon(Icons.comment),
                    Icon(Icons.share),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Post description here..."),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ================= SEARCH ================= */

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 30,
        itemBuilder: (_, __) => Container(
          margin: const EdgeInsets.all(2),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

/* ================= UPLOAD ================= */

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload")),
      body: const Center(
        child: Icon(Icons.add_a_photo, size: 100),
      ),
    );
  }
}

/* ================= REELS ================= */

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (_, __) {
          return const Center(
            child: Icon(Icons.play_circle, color: Colors.white, size: 100),
          );
        },
      ),
    );
  }
}

/* ================= PROFILE ================= */

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 10),
          const Text("Username", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text("10"), Text("Posts")]),
              Column(children: [Text("200"), Text("Followers")]),
              Column(children: [Text("180"), Text("Following")]),
            ],
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 20,
              itemBuilder: (_, __) => Container(
                margin: const EdgeInsets.all(2),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
