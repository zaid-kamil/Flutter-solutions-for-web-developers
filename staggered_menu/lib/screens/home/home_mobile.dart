import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home : Mobile Layout ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
