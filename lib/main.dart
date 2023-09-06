import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y_mobile/screens/home_screen.dart';
import 'package:y_mobile/screens/login/login_screen.dart';
import 'package:y_mobile/utils/auth_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const YUntitled(),
  ));
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
      home: const AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (authProvider.isLoggedIn) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
