// lib/widgets/menu_tile_content.dart
import 'package:flutter/material.dart';

class MenuTileContent extends StatelessWidget {
  final String title;
  final IconData icon;
  final double fontSize;

  const MenuTileContent({
    super.key,
    required this.title,
    required this.icon,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.white),
        Text(title, style: TextStyle(fontSize: fontSize, color: Colors.white)),
      ],
    );
  }
}
