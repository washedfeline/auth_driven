import 'package:flutter/material.dart';

import '../../../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      Navigator.pop(context);

      await authService.logout();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You\'re in the Home Screen!'),
            const SizedBox(height: 16),
            FilledButton(onPressed: logout, child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
