// main.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:staggered_menu/screens/main_menu/menu_screen.dart';

void main() {
  runApp(const StaggeredMenuApp());
}

class StaggeredMenuApp extends StatelessWidget {
  const StaggeredMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Staggered Menu App",
        // remove debug banner
        debugShowCheckedModeBanner: false,
        // set the start screen to the main menu screen
        home: const MainMenuScreen(),
        // update scroll behavior to the app
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          // set drag devices to touch, mouse, and unknown
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.unknown,
          },
        ));
  }
}
