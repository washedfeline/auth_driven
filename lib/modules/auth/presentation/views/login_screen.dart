import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../home/presentation/views/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      await authService.login();

      if (context.mounted) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You\'re in the Login Screen!'),
            const SizedBox(height: 16),
            FilledButton(onPressed: login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
