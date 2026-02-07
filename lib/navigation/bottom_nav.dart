import 'package:flutter/material.dart';
bottomNavigationBar: BottomNavigationBar(
  currentIndex: index,
  onTap: (i) => setState(() => index = i),
  backgroundColor: const Color(0xFF0B0F1A),
  selectedItemColor: const Color(0xFF4DA3FF),
  unselectedItemColor: Colors.white38,
  type: BottomNavigationBarType.fixed,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.play_circle_outline),
      activeIcon: Icon(Icons.play_circle),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      activeIcon: Icon(Icons.chat_bubble),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: '',
    ),
  ],
),
