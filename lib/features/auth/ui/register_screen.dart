import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/auth_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сабти ном')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final loading = state is AuthLoading;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextField(
                    controller: _username,
                    hint: 'Username',
                  ),
                  const SizedBox(height: 12),
                  AuthTextField(
                    controller: _email,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  AuthTextField(
                    controller: _password,
                    hint: 'Password',
                    obscure: true,
                  ),
                  const SizedBox(height: 24),
                  AuthButton(
                    text: 'Сабти ном',
                    loading: loading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                              username: _username.text.trim(),
                            );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
