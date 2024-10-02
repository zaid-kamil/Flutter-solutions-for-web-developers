import 'package:flutter/material.dart';

class DashboardScreenWeb extends StatefulWidget {
  final VoidCallback toggleTheme;
  final String title;
  const DashboardScreenWeb(
      {super.key, required this.toggleTheme, required this.title});

  @override
  State<DashboardScreenWeb> createState() => _DashboardScreenWebState();
}

class _DashboardScreenWebState extends State<DashboardScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
