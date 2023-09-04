import 'package:flutter/material.dart';
import 'package:y_mobile/components/signin_button.dart';
import 'package:y_mobile/components/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // @TODO: sign in method
  void signUserIn() {}

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
