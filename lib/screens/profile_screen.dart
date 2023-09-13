import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y_mobile/utils/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final fullName = '${authProvider.firstName} ${authProvider.lastName}';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // First column
                  Expanded(
                    child: Column(
                      children: [
                        Text(fullName), // placeholder
                        const SizedBox(height: 10),
                        const CircleAvatar(
                          // Placeholder for the profile picture
                          backgroundImage: NetworkImage('https://via.placeholder.com/100'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10),
                        const Text('Number of Connections'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Second column
                  const Expanded(
                    child: Column(
                      children: [
                        Text('Tools'),
                        SizedBox(height: 10),
                        Text('Location'),
                        SizedBox(height: 10),
                        Text('Level / Years of Experience'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
