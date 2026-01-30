import 'package:flutter/material.dart';
import '../features/feed/ui/feed_screen.dart';
import '../features/reels/ui/reels_screen.dart';
import '../features/upload/ui/upload_screen.dart';
import '../features/search/ui/search_screen.dart';
import '../features/profile/ui/profile_screen.dart';

class AppRouter {
  static final pages = <Widget>[
    const FeedScreen(),
    const SearchScreen(),
    const UploadScreen(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];
}
