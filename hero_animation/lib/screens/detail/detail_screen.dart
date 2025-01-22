// screens/detail/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:hero_animation/models/article.dart';
import 'package:hero_animation/screens/detail/detail_web.dart';
import 'package:hero_animation/screens/responsive_layout.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)?.settings.arguments as Article;
    return ResponsiveLayout(
      mobileLayout: const Placeholder(),
      tabletLayout: const Placeholder(),
      webLayout: DetailWeb(article: article),
    );
  }
}
