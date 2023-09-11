import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300], // Added a color for visibility. Change as needed.
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // First column
                  Expanded(
                    child: Column(
                      children: [
                        Text('Band Name / Full Name'), // placeholder
                        SizedBox(height: 10),
                        CircleAvatar(
                          // Placeholder for the profile picture
                          backgroundImage: NetworkImage('https://via.placeholder.com/100'),
                          radius: 50.0,
                        ),
                        SizedBox(height: 10),
                        Text('Number of Connections'),
                      ],
                    ),
                  ),
                  SizedBox(width: 20), // Some spacing between columns
                  // Second column
                  Expanded(
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
