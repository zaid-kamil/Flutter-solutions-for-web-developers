// lib/widgets/menu_tile_image.dart
import 'package:flutter/material.dart';

class MenuTileImage extends StatelessWidget {
  final String imgUrl;

  const MenuTileImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
