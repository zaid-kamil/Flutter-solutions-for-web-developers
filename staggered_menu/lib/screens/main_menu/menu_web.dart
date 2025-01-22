// screens/main_menu/menu_web.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_menu/widgets/menu_tile.dart';

// the web layout for the menu screen
class MenuWeb extends StatelessWidget {
  const MenuWeb({super.key});

  // list of menu items
  static const List<Map<String, dynamic>> menuItems = [
    {
      "title": "Home",
      "imgId": "11",
      "icon": Icons.home,
      "crossAxis": 2,
      "mainAxis": 2
    },
    {
      "title": "Dashboard",
      "imgId": "12",
      "icon": Icons.dashboard,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Settings",
      "imgId": "13",
      "icon": Icons.settings,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Messages",
      "imgId": "14",
      "icon": Icons.message,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Notifications",
      "imgId": "15",
      "icon": Icons.notifications,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Photos",
      "imgId": "16",
      "icon": Icons.photo,
      "crossAxis": 2,
      "mainAxis": 1
    },
    {
      "title": "Videos",
      "imgId": "17",
      "icon": Icons.video_library,
      "crossAxis": 2,
      "mainAxis": 1
    },
    {
      "title": "Music",
      "imgId": "18",
      "icon": Icons.music_note,
      "crossAxis": 2,
      "mainAxis": 1
    },
    {
      "title": "Contact",
      "imgId": "19",
      "icon": Icons.contact_phone,
      "crossAxis": 2,
      "mainAxis": 2
    },
    {
      "title": "Documents",
      "imgId": "20",
      "icon": Icons.description,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Calendar",
      "imgId": "21",
      "icon": Icons.calendar_today,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Tasks",
      "imgId": "22",
      "icon": Icons.task,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Reports",
      "imgId": "23",
      "icon": Icons.report,
      "crossAxis": 1,
      "mainAxis": 1
    },
    {
      "title": "Help",
      "imgId": "24",
      "icon": Icons.help,
      "crossAxis": 2,
      "mainAxis": 1
    }
  ];

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
                children: menuItems.map((item) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: item["crossAxis"],
                    mainAxisCellCount: item["mainAxis"],
                    // the menu tile widget with title, image id and icon
                    child: MenuTile(
                      title: item["title"],
                      imgId: item["imgId"],
                      icon: item["icon"],
                    ),
                  );
                }).toList())
          ])),
    );
  }
}
