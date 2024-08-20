// screens/main_menu/menu_screen.dart
import 'package:flutter/material.dart';

// the mobile layout for the menu screen
class MenuMobile extends StatelessWidget {
  const MenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // a placeholder scaffold with a centered text widget
    return const Scaffold(
        // todo make the menu for mobile
        body: Center(
            child: Text(
      'Menu : Mobile Layout ',
      style: TextStyle(fontSize: 20),
    )));
  }
}
