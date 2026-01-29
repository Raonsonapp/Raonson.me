import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class FirebaseService {
  static FirebaseApp? _app;
  static FirebaseAuth? _auth;

  /// 🔥 Init Firebase (як бор)
  static Future<void> init() async {
    if (_app != null) return;

    _app = await Firebase.initializeApp(
      options: _firebaseOptions(),
    );

    _auth = FirebaseAuth.instanceFor(app: _app!);
  }

  /// 🔐 Firebase Auth instance
  static FirebaseAuth get auth {
    if (_auth == null) {
      throw Exception(
        'Firebase not initialized. Call FirebaseService.init() first.',
      );
    }
    return _auth!;
  }

  /// 📱 Platform-based Firebase options
  static FirebaseOptions _firebaseOptions() {
    if (Platform.isAndroid) {
      return const FirebaseOptions(
        apiKey: 'YOUR_ANDROID_API_KEY',
        appId: 'YOUR_ANDROID_APP_ID',
        messagingSenderId: 'YOUR_SENDER_ID',
        projectId: 'YOUR_PROJECT_ID',
        storageBucket: 'YOUR_PROJECT_ID.appspot.com',
      );
    } else {
      throw UnsupportedError('Only Android is configured for now');
    }
  }
}
