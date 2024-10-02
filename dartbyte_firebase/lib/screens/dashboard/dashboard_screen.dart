import 'package:dartbyte/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen_web.dart';

class DashboardScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final String title;

  const DashboardScreen(
      {super.key, required this.toggleTheme, required this.title});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: const Placeholder(),
        tabletLayout: const Placeholder(),
        webLayout: DashboardScreenWeb(
          toggleTheme: toggleTheme,
          title: title,
        ));
  }
}
