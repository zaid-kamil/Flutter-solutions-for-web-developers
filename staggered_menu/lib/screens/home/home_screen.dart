import 'package:flutter/material.dart';

import '../responsive_layout.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';
import 'home_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: HomeMobile(),
      tabletLayout: HomeTablet(),
      webLayout: HomeWeb(),
    );
  }
}
