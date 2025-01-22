// screens/detail/detail_web.dart
import 'package:flutter/material.dart';
import 'package:hero_animation/models/article.dart';
import 'package:hero_animation/widgets/hero_app_bar.dart';

class DetailWeb extends StatelessWidget {
  final Article article;

  const DetailWeb({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeroAppBar(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(
              tag: article.image,
              // Display the image in a circular shape
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    article.image,
                    width: 512,
                    height: 512,
                    fit: BoxFit.cover,
                  ))),
          Text(article.title, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          Text(article.description, style: const TextStyle(fontSize: 16)),
        ])));
  }
}
