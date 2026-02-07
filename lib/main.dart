import 'package:flutter/material.dart';
import 'core/session.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  const RaonsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: Session.isLoggedIn(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == true) {
            return const Placeholder(); // 👉 баъд HomeScreen
          } else {
            return const Placeholder(); // 👉 баъд LoginScreen
          }
        },
      ),
    );
  }
}
