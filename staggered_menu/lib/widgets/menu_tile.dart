import 'package:flutter/material.dart';

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
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
          ),
          duration: const Duration(milliseconds: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 50,
                color: Colors.white,
              ),
              Text(
                widget.title,
              ),
            ],
          ),
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
