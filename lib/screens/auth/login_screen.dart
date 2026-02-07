ElevatedButton(
  onPressed: () async {
    setState(() => loading = true);

    final ok = await AuthService.login(
      usernameController.text,
      passwordController.text,
    );

    setState(() => loading = false);

    if (ok) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() => error = 'Login failed');
    }
  },
  child: loading
      ? const CircularProgressIndicator()
      : const Text('Login'),
)
