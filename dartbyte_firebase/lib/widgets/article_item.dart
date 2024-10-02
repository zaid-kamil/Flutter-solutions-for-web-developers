import 'package:flutter/material.dart';

class NewsArticleItem extends StatelessWidget {
  const NewsArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.6),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.primaries.last,
              radius: 20,
              child: const FlutterLogo(size: 20),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('News article title'),
            ),
          ],
        ),
      ),
    );
  }
}
