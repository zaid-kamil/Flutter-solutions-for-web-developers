// screens/main_menu/menu_tablet.dart
import 'package:flutter/material.dart';

// the tablet layout for the menu screen
class MenuTablet extends StatelessWidget {
  const MenuTablet({super.key});

  @override
  Widget build(BuildContext context) {
    // a placeholder scaffold with a centered text widget
    return const Scaffold(
        // todo make the menu for tablet
        body: Center(
            child: Text(
      'Menu : Tablet Layout',
      style: TextStyle(fontSize: 20),
    )));
  }
}
