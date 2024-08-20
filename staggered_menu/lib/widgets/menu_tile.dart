import 'package:flutter/material.dart';

// a custom widget for the menu tile
class MenuTile extends StatefulWidget {
  final String title; // the title of the menu tile
  final String imgId; // the image id for the background image
  final IconData icon; // the icon for the menu tile

  // constructor for the menu tile
  const MenuTile({
    super.key,
    required this.title,
    required this.imgId,
    required this.icon,
  });
  // create the state for the menu tile
  @override
  State<MenuTile> createState() => _MenuTileState();
}

// the state class for the menu tile
class _MenuTileState extends State<MenuTile> {
  double fontSize = 30.0; // default font size
  double imageScale = 2.0; // default image scale

  @override
  Widget build(BuildContext context) {
    // the image url with the image id received from the constructor
    var imgUrl = "https://picsum.photos/500/500?image=${widget.imgId}";
    // stack widget for making overlayed widgets
    return Stack(
        // set the alignment to center
        alignment: Alignment.center,
        children: [
          // clip the image with rounded corners
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // set the image width and height to take the available space
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  // the image widget with the image url
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover, // cover the available space
                  ))),
          // animated default text style for the title
          AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  // add a shadow to the text for better visibility
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ]),
              // set the duration for the animation
              duration: const Duration(milliseconds: 150),
              // column widget for the icon and title
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Icon and title for the menu tile
                  children: [
                    Icon(widget.icon, size: 50, color: Colors.white),
                    Text(widget.title),
                  ])),
          // material widget only for the inkwell effect (ripple effect)
          Material(
              color: Colors.transparent,
              // set the shape to rounded rectangle
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // inkwell widget for the ripple effect
              child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // show snackBar with the title of the menu tile
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      // align the content to center
                      content: Align(
                        alignment: Alignment.center,
                        child: Text(widget.title),
                      ),
                      // show the close icon for the snackbar
                      showCloseIcon: true,
                    ));
                  },
                  // set the on hover effect
                  onHover: (value) {
                    // set the state for the font size and image scale
                    // increase the font size and image scale on hover
                    setState(() {
                      fontSize = value ? 40.0 : 30.0;
                      imageScale = value ? 1.1 : 1.0;
                    });
                  }))
        ]);
  }
}
