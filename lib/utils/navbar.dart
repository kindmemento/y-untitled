import 'package:flutter/material.dart';

class DiscoveryNavBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoveryNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.location_city), // @TODO: Replace placeholder image
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.toll_outlined), // @TODO: Replace placeholder image
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.usb_rounded), // @TODO: Replace placeholder image
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.search), // @TODO: Replace placeholder image
            onPressed: () {})
      ],
    ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
