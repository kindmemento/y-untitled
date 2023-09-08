import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  final int currentindex;
  final Function(int) onTabTapped;

  const AppFooter({super.key, required this.currentindex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: currentindex, onTap: onTabTapped, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discovery'),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chat',
      ),
    ]);
  }
}
