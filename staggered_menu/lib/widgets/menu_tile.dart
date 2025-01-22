// lib/widgets/menu_tile.dart
import 'package:flutter/material.dart';

import 'menu_tile_content.dart';
import 'menu_tile_image.dart';

class MenuTile extends StatefulWidget {
  final String title;
  final String imgId;
  final IconData icon;

  const MenuTile({
    super.key,
    required this.title,
    required this.imgId,
    required this.icon,
  });

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  double fontSize = 30.0;
  double imageScale = 2.0;

  @override
  Widget build(BuildContext context) {
    var imgUrl = "https://picsum.photos/500/500?image=${widget.imgId}";

    return Stack(alignment: Alignment.center, children: [
      MenuTileImage(imgUrl: imgUrl),
      MenuTileContent(
        title: widget.title,
        icon: widget.icon,
        fontSize: fontSize,
      ),
    ]);
  }
}
