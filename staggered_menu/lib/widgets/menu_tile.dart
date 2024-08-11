import 'package:flutter/material.dart';

class MenuTile extends StatefulWidget {
  final String title;
  final String imgId;

  const MenuTile({
    super.key,
    required this.title,
    required this.imgId,
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

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedDefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            widget.title,
          ),
          duration: const Duration(milliseconds: 150),
        ),
        Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            onHover: (value) {
              setState(() {
                fontSize = value ? 40.0 : 30.0;
                imageScale = value ? 1.1 : 1.0;
              });
            },
          ),
        ),
      ],
    );
  }
}
