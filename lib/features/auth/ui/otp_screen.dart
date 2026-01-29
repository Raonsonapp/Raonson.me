import 'package:flutter/material.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/animations/scale_animation.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: ScaleAnimation(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Enter the 6-digit code sent to you',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: 'Verify',
                onTap: () {
                  // TODO: verify OTP
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
