import 'package:flutter/material.dart';

class HeroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeroAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.flight),
          SizedBox(width: 16),
          Text('Travel Articles'),
        ],
      ),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 32),
      centerTitle: true,
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
