import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y_mobile/screens/login/login_screen.dart';
import 'package:y_mobile/utils/auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const YUntitled()
      )
  );
}

class YUntitled extends StatelessWidget {
  const YUntitled({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Y Untitled',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginScreen());
  }
}
