import 'package:flutter/material.dart';
import 'package:y_mobile/utils/navbar.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DiscoveryNavBar(),
      body: Center(
        child: Text(
          'Discovery Screen',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
