// screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:hero_animation/models/Article.dart';
import 'package:hero_animation/screens/home/home_web.dart';
import 'package:hero_animation/screens/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Article> articles = Article.fetchAll();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: Placeholder(),
        tabletLayout: Placeholder(),
        webLayout: HomeWeb(articles: articles));
  }
}
