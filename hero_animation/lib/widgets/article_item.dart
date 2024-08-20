// widgets/article_item.dart
import 'package:flutter/material.dart';
import 'package:hero_animation/models/Article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 4,
              )
            ]),
        child: Column(children: [
          Expanded(
              flex: 3, // take a lot of space
              // Hero widget is used to animate
              // the image when navigating to the detail screen
              child: Hero(
                  // The tag must be unique for each image
                  tag: article.image,
                  child: Image.asset(
                    article.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(height: 8),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(article.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/detail',
                          arguments: article,
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('View Article'),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded),
                        ],
                      )),
                ],
              )),
        ]));
  }
}
