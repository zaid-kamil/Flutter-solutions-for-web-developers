// screens/main_menu/menu_web.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_menu/widgets/menu_tile.dart';

// the web layout for the menu screen
class MenuWeb extends StatelessWidget {
  const MenuWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add padding to the body
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          // the listview containing the staggered grid view
          child: ListView(children: [
            // the staggered grid view
            StaggeredGrid.count(
                crossAxisCount: 6, // no of columns
                mainAxisSpacing: 15, // spacing between the rows
                crossAxisSpacing: 15, // spacing between the columns
                // a list of staggered grid tiles
                children: const [
                  // a staggered grid tile with a menu tile widget
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2, // width of the tile
                    mainAxisCellCount: 2, // height of the tile
                    // the menu tile widget with title, image id and icon
                    child:
                        MenuTile(title: "Home", imgId: "11", icon: Icons.home),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Dashboard", imgId: "12", icon: Icons.dashboard),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Settings", imgId: "13", icon: Icons.settings),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Messages", imgId: "14", icon: Icons.message),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Notifications",
                        imgId: "15",
                        icon: Icons.notifications),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Photos", imgId: "16", icon: Icons.photo),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Videos",
                        imgId: "17",
                        icon: Icons.video_library),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Music", imgId: "18", icon: Icons.music_note),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: MenuTile(
                        title: "Contact",
                        imgId: "19",
                        icon: Icons.contact_phone),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Documents",
                        imgId: "20",
                        icon: Icons.description),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Calendar",
                        imgId: "21",
                        icon: Icons.calendar_today),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child:
                        MenuTile(title: "Tasks", imgId: "22", icon: Icons.task),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MenuTile(
                        title: "Reports", imgId: "23", icon: Icons.report),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child:
                        MenuTile(title: "Help", imgId: "24", icon: Icons.help),
                  ),
                ])
          ])),
    );
  }
}
