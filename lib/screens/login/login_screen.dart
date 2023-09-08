import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y_mobile/api/auth_service.dart';
import 'package:y_mobile/components/signin_button.dart';
import 'package:y_mobile/components/textfield.dart';
import 'package:y_mobile/screens/home_screen.dart';
import 'package:y_mobile/utils/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    final authService = AuthService(authProvider);
    final usernameOrEmailController = TextEditingController();
    final passwordController = TextEditingController();

    signUserIn() async {
      String? username;
      String? email;
      String password;

      String userInput = usernameOrEmailController.text;
      if (userInput.contains("@")) {
        email = userInput;
      } else {
        username = userInput;
      }
      password = passwordController.text;
      await authService.login(username, email, password);

      if (authProvider.isLoggedIn) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen())
        );
      }
    }

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
                controller: usernameOrEmailController,
                hintText: 'Username or Email',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Forgot password?', style: TextStyle(color: Colors.grey[600]))])),

              const SizedBox(height: 25),

              SignInButton(onTap: signUserIn),

              // or continue with google OR apple sign in buttons || THIS WILL BE IMPLEMENTED LATER ON

              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.5,
              //           color: Colors.grey[600],
              //         )
              //       ),
              //       const Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 10.0),
              //         child: Text(
              //           'Or continue with',
              //         ),
              //       ),
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.5,
              //           color: Colors.grey[600]
              //         )
              //       )
              //     ],
              //   )
              // ),

              const SizedBox(height: 25),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 4),
                  Text("Register now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                ],
              )
            ],
          )),
        ));
  }
}
