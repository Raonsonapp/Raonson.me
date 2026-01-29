import 'package:flutter/material.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/animations/slide_animation.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: SlideAnimation(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                hint: 'Username',
                controller: usernameController,
              ),
              const SizedBox(height: 12),

              CustomTextField(
                hint: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 12),

              CustomTextField(
                hint: 'Password',
                controller: passwordController,
                obscure: true,
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushNamed(context, '/otp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
