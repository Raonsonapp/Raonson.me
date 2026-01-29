import 'package:flutter/material.dart';

// Фақат он экранеро import мекунем, ки воқеан ҳаст
import 'screens/home_screen.dart';

void main() {
  runApp(RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raonson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
