// screens/home/home_web.dart
import 'package:flutter/material.dart';
import 'package:hero_animation/models/Article.dart';

import '../../widgets/article_item.dart';
import '../../widgets/hero_app_bar.dart';

class HomeWeb extends StatelessWidget {
  final List<Article> articles;

  const HomeWeb({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeroAppBar(),
        body: Row(children: [
          // create an empty container on left side
          Expanded(child: Container()),
          Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.all(16),
                  // Display the articles in a grid
                  child: GridView(
                    // Create a grid with 400 pixels
                    // as the maximum cross-axis extent
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                    ),
                    // map each article to an ArticleItem widget
                    children: articles
                        .map((article) => ArticleItem(article: article))
                        .toList(),
                  ))),
          // create an empty container on right side
          Expanded(child: Container())
        ]));
  }
}
