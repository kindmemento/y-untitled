import 'package:flutter/material.dart';
import 'package:y_mobile/screens/chat_screen.dart';
import 'package:y_mobile/screens/discovery_screen.dart';
import 'package:y_mobile/utils/footer.dart';
import 'package:y_mobile/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [const DiscoveryScreen(), const ProfileScreen(), const ChatScreen()];
    return MaterialApp(
        home: Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: AppFooter(
        currentindex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    ));
  }
}
