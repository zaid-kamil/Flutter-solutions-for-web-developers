import 'package:flutter/material.dart';
import 'package:hero_animation/models/Article.dart';
import 'package:hero_animation/screens/detail/detail_mobile.dart';
import 'package:hero_animation/screens/detail/detail_tablet.dart';
import 'package:hero_animation/screens/detail/detail_web.dart';
import 'package:hero_animation/screens/responsive_layout.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)?.settings.arguments as Article;
    return ResponsiveLayout(
      mobileLayout: DetailMobile(article: article),
      tabletLayout: DetailTablet(article: article),
      webLayout: DetailWeb(article: article),
    );
  }
}
