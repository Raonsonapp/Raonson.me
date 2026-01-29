import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/logic/auth_cubit.dart';
import '../features/auth/logic/auth_state.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/feed/ui/feed_screen.dart';

class RouteGuard extends StatelessWidget {
  const RouteGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const FeedScreen(); // Home (Instagram Feed)
        }
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return const LoginScreen();
      },
    );
  }
}
