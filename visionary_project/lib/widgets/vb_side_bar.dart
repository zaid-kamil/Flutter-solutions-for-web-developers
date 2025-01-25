import 'package:flutter/material.dart';

/// A drawer widget for the Visionary app
class VisionDrawer extends StatelessWidget {
  /// The background color of the drawer
  final Color color;

  /// Callback functions to handle sign out and add item
  final VoidCallback signOut;
  final VoidCallback addItem;

  /// Constructor for VisionDrawer
  const VisionDrawer({
    super.key,
    required this.color,
    required this.signOut,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      elevation: 2,
      width: 400,
      backgroundColor: color,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  FlutterLogo(size: 100),
                  Text("Welcome to your visionary board!"),
                ],
              ),
            ),
          ),
          ListTile(
            hoverColor: Colors.white,
            leading: const Icon(Icons.add_box),
            title: const Text('A D D   I T E M'),
            onTap: addItem,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('L O G O U T'),
            onTap: signOut,
          ),
        ],
      ),
    );
  }
}
