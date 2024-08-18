import 'modules/auth/data/services/auth_service.dart';
import 'modules/auth/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';

late final AuthService authService;

void main() {
  authService = AuthService();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Auth Driven',
      home: LoginScreen(),
    );
  }
}
