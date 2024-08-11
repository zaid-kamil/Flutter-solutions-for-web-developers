import 'package:flutter/material.dart';
import 'package:hero_animation/models/Article.dart';

class ArticleItem extends StatefulWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
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
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Hero(
              tag: widget.article.image,
              child: Image.network(
                widget.article.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 2,
            child: Text(
              widget.article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/detail',
                    arguments: widget.article,
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
          )
        ],
      ),
    );
  }
}
