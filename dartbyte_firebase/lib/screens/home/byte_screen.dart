import 'package:dartbyte/screens/home/byte_screen_web.dart';
import 'package:dartbyte/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

class ByteBoard extends StatelessWidget {
  final VoidCallback toggleTheme;
  final String title;
  const ByteBoard({super.key, required this.toggleTheme, required this.title});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: const Placeholder(),
        tabletLayout: const Placeholder(),
        webLayout: ByteBoardWeb(
          toggleTheme: toggleTheme,
          title: title,
        ));
  }
}
