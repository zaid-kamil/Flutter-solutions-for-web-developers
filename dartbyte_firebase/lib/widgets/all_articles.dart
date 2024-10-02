import 'package:flutter/material.dart';

import 'article_item.dart';

class AllArticleRow extends StatelessWidget {
  const AllArticleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: List.generate(6, (index) {
                return const NewsArticleItem();
              }),
            ),
          ),
          Expanded(
            child: Column(
              children: List.generate(5, (index) {
                return const NewsArticleItem();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
