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
      body: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                ),
                children: articles
                    .map((article) => ArticleItem(article: article))
                    .toList(),
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
