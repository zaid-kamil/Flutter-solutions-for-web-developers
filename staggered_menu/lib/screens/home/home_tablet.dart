import 'package:flutter/material.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home : Tablet Layout',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
