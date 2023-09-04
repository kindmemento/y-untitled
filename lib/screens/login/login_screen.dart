import 'package:flutter/material.dart';
import 'package:y_mobile/components/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 25),
              // TO BE REPLACED WITH ACTUAL LOGO
              const Icon(Icons.lock, size: 100),
              // PLACEHOLDER TEXT
              Text(
                'Welcome back',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              // forgot pwd?

              // sign in button

              // or continue with

              // google OR apple sign in buttons

              // Don't have an account? Register now
            ],
          )),
        ));
  }
}
