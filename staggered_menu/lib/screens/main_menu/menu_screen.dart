// screens/main_menu/menu_screen.dart
import 'package:flutter/material.dart';

import '../responsive_layout.dart';
import 'menu_mobile.dart';
import 'menu_tablet.dart';
import 'menu_web.dart';

// entry point for the main menu screen
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return the responsive layout widget based on the screen width
    return const ResponsiveLayout(
      mobileLayout: MenuMobile(),
      tabletLayout: MenuTablet(),
      webLayout: MenuWeb(),
    );
  }
}
