import 'package:dartbyte/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'login_screen_web.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final String title;

  const LoginScreen(
      {super.key, required this.toggleTheme, required this.title});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: const Placeholder(),
      tabletLayout: const Placeholder(),
      webLayout: LoginScreenWeb(
        toggleTheme: toggleTheme,
        title: title,
      ),
    );
  }
}
